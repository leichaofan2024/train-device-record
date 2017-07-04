class Equipments::RayResistanceRingsController < ApplicationController
  def index
      @station = Station.find(params[:station_id])
      @ray_resistance_rings = RayResistanceRing.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
  end

  def show
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @ray_resistance_ring = RayResistanceRing.find(params[:id])
  end

  def new
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @ray_resistance_ring = RayResistanceRing.new
  end

  def create
      @ray_resistance_ring = RayResistanceRing.new(ray_resistance_ring_params)
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @ray_resistance_ring.station = current_station
      @ray_resistance_ring.equipment_category_id = @equipment_category.id
      redirect_to station_path(current_station) if @ray_resistance_ring.save
  end

  def edit
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @ray_resistance_ring = RayResistanceRing.find(params[:id])
  end

  def update
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @ray_resistance_ring = RayResistanceRing.find(params[:id])
      @ray_resistance_ring.update(ray_resistance_ring_params)
      redirect_to equipment_category_equipmnets_ray_resistance_ring_path(@equipment_category, @ray_resistance_ring)
  end

  private

  def ray_resistance_ring_params
      params.require(:ray_resistance_ring).permit(
          :station_id,
          :equipment_category_id, #
          :factory_id, #
          :running_number, # 运行编号
          :name, # 设备名称
          :standard, # 规格型号
          :rated_voltage, # 额定电压
          :manufacture_date, # 出厂日期
          :commissioning_date, # 投运日期
          :remark # 备注
      )
  end
end
