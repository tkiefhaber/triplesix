class UsersController < ApplicationController
  def show
    if params[:username] == 'admin'
      redirect_to admin_users_path
    else
      @user = User.find_by_slug(params[:username])
      @presenter = UserPresenter.new(@user)
    end
  end

end
