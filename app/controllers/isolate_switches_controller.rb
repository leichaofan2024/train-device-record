class IsolateSwitchesController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @isolate_switches = IsolateSwitch.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @isolate_switch = IsolateSwitch.find(params[:id])
  end

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @isolate_switch = IsolateSwitch.new
  end

  def create
    @isolate_switch = IsolateSwitch.new(isolate_switch_params)
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

    @isolate_switch.equipment_category_id = @equipment_category.id
    if @isolate_switch.save
      redirect_to station_path(current_station)
    end
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @isolate_switch = IsolateSwitch.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @isolate_switch = IsolateSwitch.find(params[:id])
    @isolate_switch.update(isolate_switch_params)
    redirect_to equipment_category_isolate_switch_path(@equipment_category,@isolate_switch)
  end

  private

  def isolate_switch_params
    params.require(:isolate_switch).permit(
                                          :station_id,
                                          :equipment_category_id,    #
                                          :factory_id,               #
                                          :running_number,            #运行编号
                                          :standard,                  #规格型号
                                          :rated_voltage,             #额定电压
                                          :rated_current,             #额定电流
                                          :status,                    #状态
                                          :manufacture_date,          #出厂日期
                                          :commissioning_date,        #投运日期
                                          :remark,                    #备注
)
  end
end
