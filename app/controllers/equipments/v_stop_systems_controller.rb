class Equipments::VStopSystemsController < ApplicationController
  def index
      @station = Station.find(params[:station_id])
      @v_stop_systems = VStopSystem.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
  end

  def show
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @v_stop_system = VStopSystem.find(params[:id])
  end

  def new
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @v_stop_system = VStopSystem.new
  end

  def create
      @v_stop_system = VStopSystem.new(v_stop_system_params)
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @v_stop_system.station = current_station
      @v_stop_system.equipment_category_id = @equipment_category.id
      redirect_to station_path(current_station) if @v_stop_system.save
  end

  def edit
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @v_stop_system = VStopSystem.find(params[:id])
  end

  def update
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @v_stop_system = VStopSystem.find(params[:id])
      @v_stop_system.update(v_stop_system_params)
      redirect_to equipment_category_equipmnets_v_stop_system_path(@equipment_category, @v_stop_system)
  end

  private

  def v_stop_system_params
      params.require(:v_stop_system).permit(
          :station_id,
          :equipment_category_id, #
          :factory_id, #
          :standard, # 规格型号
          :wen_control_number, # 温控柜数量
          :control_number, # 控制群数量
          :manufacture_date, # 出厂日期
          :commissioning_date, # 投运日期
          :remark # 备注
      )
  end
end
