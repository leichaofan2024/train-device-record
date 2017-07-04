class Equipments::InsulationDevicesController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @insulation_devicees = InsulationDevice.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @insulation_device = InsulationDevice.find(params[:id])
  end

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @insulation_device = InsulationDevice.new
  end

  def create
    @insulation_device = InsulationDevice.new(insulation_device_params)
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @insulation_device.station = current_station
    @insulation_device.equipment_category_id = @equipment_category.id
    if @insulation_device.save
      redirect_to station_path(current_station)
    end
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @insulation_device = InsulationDevice.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @insulation_device = InsulationDevice.find(params[:id])
    @insulation_device.update(insulation_device_params)
    redirect_to equipment_category_equipmnets_insulation_device_path(@equipment_category,@insulation_device)
  end

  private

  def insulation_device_params
    params.require(:insulation_device).permit(
                                          :station_id,
                                          :equipment_category_id,    #
                                          :factory_id,               #
                                          :standard,                  #规格型号
                                          :detecting_instrument,             #检测设备数
                                          :manufacture_date,          #出厂日期
                                          :commissioning_date,        #投运日期
                                          :remark,                    #备注
)
  end
end
