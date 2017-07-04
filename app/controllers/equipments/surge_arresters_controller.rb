class Equipments::SurgeArrestersController < ApplicationController
  def index
      @station = Station.find(params[:station_id])
      @surge_arresters = SurgeArrester.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
  end

  def show
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @surge_arrester = SurgeArrester.find(params[:id])
  end

  def new
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @surge_arrester = SurgeArrester.new
  end

  def create
      @surge_arrester = SurgeArrester.new(surge_arrester_params)
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @surge_arrester.station = current_station
      @surge_arrester.equipment_category_id = @equipment_category.id
      redirect_to station_path(current_station) if @surge_arrester.save
  end

  def edit
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @surge_arrester = SurgeArrester.find(params[:id])
  end

  def update
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @surge_arrester = SurgeArrester.find(params[:id])
      @surge_arrester.update(surge_arrester_params)
      redirect_to equipment_category_equipmnets_surge_arrester_path(@equipment_category, @surge_arrester)
  end

  private

  def surge_arrester_params
      params.require(:surge_arrester).permit(
          :station_id,
          :equipment_category_id, #
          :factory_id, #
          :running_number, # 运行编号
          :standard, # 规格型号
          :rated_voltage, # 额定电压
          :manufacture_date, # 出厂日期
          :commissioning_date, # 投运日期
          :remark, # 备注
          :casing # 套管材质

      )
  end
end
