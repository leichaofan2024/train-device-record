class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_station

  def current_station
    if current_user.present?
      @current_station = Station.find(current_user.station_id)
    else
      redirect_to root_path
    end
  end

end
