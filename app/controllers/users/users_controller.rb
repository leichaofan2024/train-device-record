class Users::UsersController < ApplicationController
  def index
    @users = User.all.where(station_id: current_station.id)
  end
end
