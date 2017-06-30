class Equipments::VideoMonitoringSystemsController < ApplicationController
  def index
      @station = Station.find(params[:station_id])
      @video_monitoring_systems = VideoMonitoringSystem.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
  end

  def show
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @video_monitoring_system = VideoMonitoringSystem.find(params[:id])
  end

  def new
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @video_monitoring_system = VideoMonitoringSystem.new
  end

  def create
      @video_monitoring_system = VideoMonitoringSystem.new(video_monitoring_system_params)
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

      @video_monitoring_system.equipment_category_id = @equipment_category.id
      redirect_to station_path(current_station) if @video_monitoring_system.save
  end

  def edit
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @video_monitoring_system = VideoMonitoringSystem.find(params[:id])
  end

  def update
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @video_monitoring_system = VideoMonitoringSystem.find(params[:id])
      @video_monitoring_system.update(video_monitoring_system_params)
      redirect_to equipment_category_equipmnets_video_monitoring_system_path(@equipment_category, @video_monitoring_system)
  end

  private

  def video_monitoring_system_params
      params.require(:video_monitoring_system).permit(
          :station_id,
          :equipment_category_id, #
          :factory_id, #
          :name, # 设备名称
          :manufacture_number, # 出厂序号
          :manufacture_date, # 出厂日期
          :commissioning_date, # 投运日期
          :remark # 备注
      )
  end
end
