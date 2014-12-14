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
    Time.use_zone(user.timezone) { most_recent_drink.created_at.strftime("%b %e, %l:%M %p")} if most_recent_drink.present?
  end

  def veggies_today_count
    veggies_today.count
  end

  def veggies_today_percentage_to_goal
    veggies_today_count / BigDecimal.new(6)
  end

  def most_recent_veggie_time
    Time.use_zone(user.timezone) { most_recent_veggie.created_at.strftime("%b %e, %l:%M %p")} if most_recent_veggie.present?
  end

  def sweats_this_week_count
    sweats_this_week.count
  end

  def sweats_this_week_percentage_to_goal
    sweats_this_week_count / BigDecimal.new(6)
  end

  def most_recent_sweat_time
    Time.use_zone(user.timezone) { most_recent_sweat.created_at.strftime("%b %e, %l:%M %p")} if most_recent_veggie.present?
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

    def veggies_today
      @veggies_today ||= @user.veggies_on(Date.today)
    end

    def veggies_this_week
      @veggies_this_week ||= @user.veggies_this_week
    end

    def most_recent_veggie
      @most_recent_veggie ||= veggies_this_week.order('created_at DESC').first
    end

    def sweats_today
      @sweats_today ||= @user.sweats_on(Date.today)
    end

    def sweats_this_week
      @sweats_this_week ||= @user.sweats_this_week
    end

    def most_recent_sweat
      @most_recent_sweat ||= sweats_this_week.order('created_at DESC').first
    end

end
