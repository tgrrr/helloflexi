class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    if current_user.try(:admin?)
      @blogs = Blog.all
    else
      redirect_to root_url, notice: "Blogs are coming soon!"
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    if current_user.try(:admin?)

      @blog = Blog.new(blog_params)

      respond_to do |format|
        if @blog.save
          format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
          format.json { render :show, status: :created, location: @blog }
        else
          format.html { render :new }
          format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end

    else
      redirect_to root_url, notice: "Naughty naughty. You're not allowed to enter this page"
    end

  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    if current_user.try(:admin?)

      respond_to do |format|
        if @blog.update(blog_params)
          format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
          format.json { render :show, status: :ok, location: @blog }
        else
          format.html { render :edit }
          format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url, notice: "Naughty naughty. You're not allowed to enter this page"
    end

  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def blog_params
    params.require(:blog).permit(:title, :body, :category)
  end
end
