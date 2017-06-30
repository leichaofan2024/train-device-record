class Equipments::TrendsValveControllablesController < ApplicationController
  def index
   @station = Station.find(params[:station_id])
   @trends_valve_controllables = TrendsValveControllable.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
   @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
   @trends_valve_controllable = TrendsValveControllable.find(params[:id])
  end

  def new
   @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
   @trends_valve_controllable = TrendsValveControllable.new
  end

  def create
   @trends_valve_controllable = TrendsValveControllable.new(trends_valve_controllable_params)
   @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

   @trends_valve_controllable.equipment_category_id = @equipment_category.id
   if @trends_valve_controllable.save
     redirect_to station_path(current_station)
   end
  end

  def edit
   @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
   @trends_valve_controllable = TrendsValveControllable.find(params[:id])
  end

  def update
   @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
   @trends_valve_controllable = TrendsValveControllable.find(params[:id])
   @trends_valve_controllable.update(trends_valve_controllable_params)
   redirect_to equipment_category_equipmnets_trends_valve_controllable_path(@equipment_category,@trends_valve_controllable)
  end

  private

  def trends_valve_controllable_params
   params.require(:trends_valve_controllable).permit(
                                         :station_id,
                                         :equipment_category_id,    #
                                         :factory_id,               #
                                         :running_number,            #运行编号
                                         :standard ,                 #规格型号
                                         :rated_voltage  ,           #额定电压
                                         :rated_current ,            #额定电流
                                         :cooling_method ,           #冷却方式
                                         :total_weight  ,            #总重
                                         :manufacture_date,          #出厂日期
                                         :commissioning_date,        #投运日期
                                         :remark ,                   #备注
  )
  end
end
