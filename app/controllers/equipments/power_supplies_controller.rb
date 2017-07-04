class Equipments::PowerSuppliesController < ApplicationController
  def index
      @station = Station.find(params[:station_id])
      @power_supplies = PowerSupply.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
  end

  def show
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @power_supply = PowerSupply.find(params[:id])
  end

  def new
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @power_supply = PowerSupply.new
  end

  def create
      @power_supply = PowerSupply.new(power_supply_params)
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @power_supply.station = current_station
      @power_supply.equipment_category_id = @equipment_category.id
      redirect_to station_path(current_station) if @power_supply.save
  end

  def edit
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @power_supply = PowerSupply.find(params[:id])
  end

  def update
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @power_supply = PowerSupply.find(params[:id])
      @power_supply.update(power_supply_params)
      redirect_to equipment_category_equipmnets_power_supply_path(@equipment_category, @power_supply)
  end

  private

  def power_supply_params
      params.require(:power_supply).permit(
          :station_id,
          :equipment_category_id, #
          :factory_id, #
          :standard, # 规格型号
          :rated_voltage, # 额定电压
          :rated_current, # 额定电流
          :way, # 整流方式

          :manufacture_date, # 出厂日期
          :commissioning_date, # 投运日期
          :remark # 备注

      )
  end
end
