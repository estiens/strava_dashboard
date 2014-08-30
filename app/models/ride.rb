class Ride < ActiveRecord::Base
  belongs_to :biker

  scope :between_dates, ->(begin_date, end_date) {
    where("datetime between ? and ?", begin_date, end_date)
  }

  def self.this_week
    self.between_dates(Time.now.beginning_of_week, Time.now)
  end

  def self.last_week
    self.between_dates((Time.now - 7.days).beginning_of_week, (Time.now-7.days).end_of_week)
  end
end