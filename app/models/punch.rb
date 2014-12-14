class Punch < ActiveRecord::Base
  belongs_to :user
  scope :drinks,  -> { where(punch_type: 'water' ) }
  scope :veggies, -> { where(punch_type: 'veggie') }

  def self.drinks_on(date, timezone)
    Time.use_zone(timezone) { drinks.where(['? <= created_at AND created_at <= ?', date.beginning_of_day, date.end_of_day]) }
  end

  def self.drinks_this_week(date, timezone)
    Time.use_zone(timezone) { drinks.where(['? <= created_at AND created_at <= ?', date.beginning_of_week.beginning_of_day, date.end_of_week.end_of_day])}
  end

  def self.veggies_on(date, timezone)
    Time.use_zone(timezone) { veggies.where(['? <= created_at AND created_at <= ?', date.beginning_of_day, date.end_of_day]) }
  end

  def self.veggies_this_week(date, timezone)
    Time.use_zone(timezone) { veggies.where(['? <= created_at AND created_at <= ?', date.beginning_of_week.beginning_of_day, date.end_of_week.end_of_day])}
  end
end
