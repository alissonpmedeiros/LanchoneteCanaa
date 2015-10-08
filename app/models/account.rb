class Account < ActiveRecord::Base
  belongs_to :customer

  def self.search_day(date)
    where('created_at >= ? AND created_at <= ?', date.beginning_of_day, date.end_of_day)
  end

  def self.search_week(date)
    where('created_at >= ? AND created_at <= ?', date.beginning_of_week, date.end_of_week)
  end

  def self.search_month(date)
    where('created_at >= ? AND created_at <= ?', date.beginning_of_month, date.end_of_month)
  end

  def self.search_year(date)
    where('created_at >= ? AND created_at <= ?', date.beginning_of_year, date.end_of_year)
  end

end
