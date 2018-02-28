class Blacklist < ActiveRecord::Base
  belongs_to :klass
  
  after_create :set_blocked_classes

  def set_blocked_classes
    klass_name = self.klass.title
    Klass.where(title: klass_name).
      where('start_timestamp >= ?', self.start_date).
      where('end_timestamp <= ?', self.end_date).
      update_all(blacklist: true)
  end
end

# Example

# Klass.where(title: "Level 5 Bikram Yoga").where('start_timestamp >= ?', 1.year.ago).where('end_timestamp <= ?', Date.today).update_all(blacklist: true)