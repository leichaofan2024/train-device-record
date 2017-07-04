class Equipments::LightningRodsController < ApplicationController
  def index
      @station = Station.find(params[:station_id])
      @lightning_rods = LightningRod.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
  end

  def show
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @lightning_rod = LightningRod.find(params[:id])
  end

  def new
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @lightning_rod = LightningRod.new
  end

  def create
      @lightning_rod = LightningRod.new(lightning_rod_params)
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @lightning_rod.station = current_station
      @lightning_rod.equipment_category_id = @equipment_category.id
      redirect_to station_path(current_station) if @lightning_rod.save
  end

  def edit
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @lightning_rod = LightningRod.find(params[:id])
  end

  def update
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @lightning_rod = LightningRod.find(params[:id])
      @lightning_rod.update(lightning_rod_params)
      redirect_to equipment_category_equipmnets_lightning_rod_path(@equipment_category, @lightning_rod)
  end

  private

  def lightning_rod_params
      params.require(:lightning_rod).permit(
          :station_id,
          :equipment_category_id, #
          :factory_id, #
          :running_number, # 运行编号
          :standard, # 规格型号
          :height, # 高度
          :category, # 类型
          :manufacture_date, # 出厂日期
          :commissioning_date, # 投运日期
          :remark # 备注
      )
  end
end
