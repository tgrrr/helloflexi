class Klass < ActiveRecord::Base
  belongs_to :studio

  has_many :sign_ups

  self.per_page = 10

  @@utc_offset = Time.zone.now.formatted_offset

  def klass_with_studio
    "#{self.title} - #{self.studio.studio_name}"
  end

  def self.unique_values
#        all.distinct
  end

  def self.get_classes_per_day(user_id, nextweek)
    week_days  = {}
    start_date = Date.today.beginning_of_week + (nextweek ? 7 : 0)
    end_date   = Date.today.end_of_week + (nextweek ? 7 : 0)
    user_sign_ups = "SELECT * FROM sign_ups WHERE user_id = #{user_id}"
    (start_date..end_date).each do |date|
      week_days[date.strftime('%a')] = Klass.joins("LEFT JOIN (#{user_sign_ups}) su ON su.klass_id = klasses.id")
      .select('klasses.*, su.id as sign_up_id, su.canceled as sign_up_canceled')
      .where(:start_timestamp => date..date + 1.days)
      .order('start_timestamp ASC').all
    end
    week_days
  end

  class << self
    def load start_date = Date.today.beginning_of_week, end_date = start_date + 7
      Studio.all.each do |s|
        klasses = MbApi::ClassService.fetch_studio_schedule site_id: s.site_ids, start_date: start_date, end_date: end_date
        existing_klasses = Klass.where(start_timestamp: start_date..end_date, studio_id: s.id).pluck('class_id')

        if klasses.present?
          klasses.each_with_index do |course, index|
            existing_klasses = existing_klasses - [course[:id].to_i]
            if course.present? && course[:id].present? && Klass.find_by(class_id: course[:id]).blank?
              klass = mb_params course
              klass[:studio_id] = s.id
              klass = Klass.create(klass)
            end
          end
        end
        Klass.where(class_id: existing_klasses, studio_id: s.id).destroy_all
      end
    end

    private

    def mb_params course
      {class_id: course[:id],
      title: course[:class_description][:name],
      can_book: course[:location][:can_book],
      max_capacity: course[:max_capacity],
      web_capacity: course[:web_capacity],
      total_booked: course[:total_booked],
      address: course[:location][:address],
      city: course[:location][:city],
      state_prov_code: course[:location][:state_prov_code],
      postal_code: course[:location][:postal_code],
      latitude: course[:location][:latitude],
      longitude: course[:location][:longitude],
      business_description: course[:location][:business_description],
      location_name: course[:location][:name],
      location_id: course[:location][:id],
      # level: course[:class_description][:level],
      class_description: course[:class_description][:description],
      class_type: course[:class_description][:program][:schedule_type],
      session_type_name: course[:class_description][:session_type][:name],
      session_type_id: course[:class_description][:session_type][:id],
      staff_name: course[:staff][:name],
      staff_id: course[:staff][:id],
      staff_bio: course[:staff][:bio],
      staff_avatar: course[:staff][:image_url],
      start_timestamp: course[:start_date_time].change(:offset => @@utc_offset),
      end_timestamp: course[:end_date_time].change(:offset => @@utc_offset),
      is_canceled: course[:is_canceled]}
    end
  end

end
