class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_station

  def current_station
    if current_user.present?
      @current_station = Station.find(current_user.station_id)
    else
      redirect_to root_path,alert: "请先登录！"
    end
  end

  def require_is_leader
    if current_user.job_number != "007"
      redirect_to root_path,alert: "你没有权限！"
    end
  end

  def require_is_admin
    if current_user.job_number == "007"
      current_user.is_admin = true
      current_user.save
    end
    if !current_user.is_admin?
      redirect_to root_path, alert: "你没有权限！"
    end
  end


end
