class PunchesController < ApplicationController
  def create
    @user = User.find(params[:punch][:user_id])
    @punch = @user.punches.new(punch_type: params[:punch][:punch_type], user_id: params[:punch][:user_id])
    if @punch.save
      render json: {}, status: 200
    else
      render json: {}, status: 500
    end
  end
end
