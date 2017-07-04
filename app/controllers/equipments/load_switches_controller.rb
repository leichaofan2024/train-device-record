class Equipments::LoadSwitchesController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @load_switches = LoadSwitch.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @load_switch = LoadSwitch.find(params[:id])
  end

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @load_switch = LoadSwitch.new
  end

  def create
    @load_switch = LoadSwitch.new(load_switch_params)
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @load_switch.station = current_station
    @load_switch.equipment_category_id = @equipment_category.id
    if @load_switch.save
      redirect_to station_path(current_station)
    end
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @load_switch = LoadSwitch.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @load_switch = LoadSwitch.find(params[:id])
    @load_switch.update(load_switch_params)
    redirect_to equipment_category_equipmnets_load_switch_path(@equipment_category,@load_switch)
  end

  private

  def load_switch_params
    params.require(:load_switch).permit(
                                          :station_id,
                                          :equipment_category_id,    #
                                          :factory_id,               #
                                          :running_number,            #运行编号
                                          :standard,                  #规格型号
                                          :rated_voltage,             #额定电压
                                          :rated_current,             #额定电流
                                          :orgnization_model,                    #状态
                                          :manufacture_date,          #出厂日期
                                          :manufacture_number,
                                          :commissioning_date,        #投运日期
                                          :remark,                    #备注
)
  end
end
