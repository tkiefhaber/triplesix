class UserPresenter
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def drinks_today_count
    drinks_today.count
  end

  def drinks_today_percentage_to_goal
    drinks_today_count / BigDecimal.new(6)
  end

  def most_recent_drink_time
    Time.use_zone(user.timezone) { most_recent_drink.created_at.strftime("%b %e, %l:%M %p")}
  end

  private
    def drinks_today
      @drinks_today ||= @user.drinks_on(Date.today)
    end

    def drinks_this_week
      @drinks_this_week ||= @user.drinks_this_week
    end

    def most_recent_drink
      @most_recent_drink ||= drinks_this_week.order('created_at DESC').first
    end

end
