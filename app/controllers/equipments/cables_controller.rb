class Equipments::CablesController < ApplicationController
  def index
      @station = Station.find(params[:station_id])
      @cables = Cable.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
  end

  def show
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @cable = Cable.find(params[:id])
  end

  def new
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @cable = Cable.new
  end

  def create
      @cable = Cable.new(cable_params)
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @cable.station = current_station

      @cable.equipment_category_id = @equipment_category.id
      redirect_to station_path(current_station) if @cable.save
  end

  def edit
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @cable = Cable.find(params[:id])
  end

  def update
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @cable = Cable.find(params[:id])
      @cable.update(cable_params)
      redirect_to equipment_category_equipmnets_cable_path(@equipment_category, @cable)
  end

  private

  def cable_params
      params.require(:cable).permit(
          :station_id,
          :equipment_category_id, #
          :factory_id, #
          :standard, # 规格型号
          :rated_voltage, # 额定电压
          :length, # 长度
          :category, # 类型
          :manufacture_date, # 出厂日期
          :commissioning_date, # 投运日期
          :remark # 备注
      )
  end
end
