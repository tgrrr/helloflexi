class   PagesController < ApplicationController
  before_filter :authenticate_user!, only: [:classes, :sign_ups]
  skip_before_action :check_if_paid, except: [:classes, :my_classes, :sign_up, :sign_ups]
  respond_to :html, :js, :json
  def home

  end

  def classes
    if current_user.monthly_class_visits < 30
      @user = current_user
      @klasses = Klass.get_classes_per_day(@user.id, false)
      # @klasses = Klass.paginate(page: params[:page])
      # @klasses_paginated = @klasses.get_classes_per_day(false)
      respond_to do |format|
        format.html
        format.js
      end
    else
      redirect_to root_path, notice: "I'm sorry, you have exceeded your maximum number of monthly class signups. Your count will reset at the beginning of the month."
    end
  end

  def nextweek_classes
    if current_user.monthly_class_visits < 30
      @user = current_user
      @klasses = Klass.get_classes_per_day(@user.id, true)
      # @klasses = Klass.paginate(page: params[:page])
      # @klasses_paginated = @klasses.get_classes_per_day(true)
      respond_to do |format|
        format.html
        format.js 
      end
    else
      redirect_to root_path, notice: "I'm sorry, you have exceeded your maximum number of monthly class signups. Your count will reset at the beginning of the month."
    end
  end

  def my_classes
    @sign_ups = current_user.sign_ups
  end

  def sign_up
    @klass = Klass.find params[:klass_id]
    respond_to do |format|
      if @klass
        mb_user = current_user.mb_users.where('studio_id = ?', @klass.studio_id).first 
        mb_user||= MbUser.create @klass.studio, current_user
        if MbApi::ClassService.sing_up @klass.studio.site_ids, mb_user.mb_id, @klass.class_id
          SignUp.create!(klass_id: @klass.id, user_id: current_user.try(:id))
          format.html { redirect_to classes_path, notice: "You have sucessfully signed up for the class." }
          format.json { render json: { klass: @klass.id, message: "You have sucessfully signed up for the class." }, success: true } 
        else
          format.html { redirect_to classes_path, notice: "Your sign up request for the class has been failed." }
          format.json {render json: { message: "Your sign up request for the class has been failed." }, success: false}
        end
      else
        format.html { redirect_to classes_path, notice: "The class does not exist." }
        format.json {render json: { message: "The class does not exist." }, success: false }
      end
    end
  end

  def cancel
    @klass = Klass.find params[:klass_id]
    respond_to do |format|
      if @klass
        mb_user = current_user.mb_users.where('studio_id = ?', @klass.studio_id).first
        if MbApi::ClassService.cancel @klass.studio.site_ids, mb_user.mb_id, @klass.class_id
          sign_up = current_user.sign_ups.find_by_klass_id(@klass.id)
          sign_up.update canceled: true, canceled_at: DateTime.now
          format.html {redirect_to classes_path, success: "You have sucessfully canceled the class."}
          format.json {render json: { message: "You have sucessfully canceled the class."}, success: true}
        else
          format.html {redirect_to classes_path, notice: "Your cancel request for the class has been failed." }
          format.json {render json: { message: "Your cancel request for the class has been failed."}, success: false}
        end
      else
        format.html {redirect_to classes_path, notice: "The class does not exist." }
        format.json {render json: {message: "The class does not exist."}, success: false}
      end
    end
  end

  def sign_ups
    @sign_ups = SignUp.all
  end

  def about
  end

  def contact
  end

  def faqs
  end

  def toc
  end

  def privacy
  end

end
