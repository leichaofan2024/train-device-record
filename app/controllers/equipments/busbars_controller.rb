class Equipments::BusbarsController < ApplicationController
  def index
      @station = Station.find(params[:station_id])
      @busbars = Busbar.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
  end

  def show
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @busbar = Busbar.find(params[:id])
  end

  def new
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @busbar = Busbar.new
  end

  def create
      @busbar = Busbar.new(busbar_params)
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @busbar.station = current_station
      @busbar.equipment_category_id = @equipment_category.id
      redirect_to station_path(current_station) if @busbar.save
  end

  def edit
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @busbar = Busbar.find(params[:id])
  end

  def update
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @busbar = Busbar.find(params[:id])
      @busbar.update(busbar_params)
      redirect_to equipment_category_equipmnets_busbar_path(@equipment_category, @busbar)
  end

  private

  def busbar_params
      params.require(:busbar).permit(
          :station_id,
          :equipment_category_id, #
          :factory_id, #
          :standard, # 规格型号
          :environment, # 工作环境
          :length, # 长度
          :category, # 类型
          :manufacture_date, # 出厂日期
          :commissioning_date, # 投运日期
          :remark # 备注
      )
  end
end
