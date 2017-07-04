class Equipments::BatteriesController < ApplicationController
  def index
      @station = Station.find(params[:station_id])
      @batteries = Battery.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
  end

  def show
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @battery = Battery.find(params[:id])
  end

  def new
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @battery = Battery.new
  end

  def create
      @battery = Battery.new(battery_params)
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @battery.station = current_station
      @battery.equipment_category_id = @equipment_category.id
      redirect_to station_path(current_station) if @battery.save
  end

  def edit
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @battery = Battery.find(params[:id])
  end

  def update
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @battery = Battery.find(params[:id])
      @battery.update(battery_params)
      redirect_to equipment_category_equipmnets_battery_path(@equipment_category, @battery)
  end

  private

  def battery_params
      params.require(:battery).permit(
          :station_id,
          :equipment_category_id, #
          :factory_id, #
          :standard, # 规格型号
          :number,
          :rated_voltage,
          :single_voltage,
          :rated_capacity,
          :category, # 类型
          :manufacture_date, # 出厂日期
          :commissioning_date, # 投运日期
          :remark # 备注
      )
  end
end
