class Equipments::TrendsShuntCapacitorsController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @trends_shunt_capacitors = TrendsShuntCapacitor.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_shunt_capacitor = TrendsShuntCapacitor.find(params[:id])
  end

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_shunt_capacitor = TrendsShuntCapacitor.new
  end

  def create
    @trends_shunt_capacitor = TrendsShuntCapacitor.new(trends_shunt_capacitor_params)
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_shunt_capacitor.station = current_station
    @trends_shunt_capacitor.equipment_category_id = @equipment_category.id
    if @trends_shunt_capacitor.save
      redirect_to station_path(current_station)
    end
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_shunt_capacitor = TrendsShuntCapacitor.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_shunt_capacitor = TrendsShuntCapacitor.find(params[:id])
    @trends_shunt_capacitor.update(trends_shunt_capacitor_params)
    redirect_to equipment_category_equipmnets_trends_shunt_capacitor_path(@equipment_category,@trends_shunt_capacitor)
  end

  private

  def trends_shunt_capacitor_params
    params.require(:trends_shunt_capacitor).permit(
                                          :station_id,
                                          :equipment_category_id,    #
                                          :factory_id,               #
                                          :running_number ,           #运行编号
                                          :standard  ,                #规格型号
                                          :count  ,               #数量
                                          :rated_voltage  ,           #额定电压
                                          :rated_capacity ,          #额定容量
                                          :rated_volume  ,            #额定电容
                                          :manufacture_date ,         #出厂日期
                                          :commissioning_date ,       #投运日期
                                          :remark ,                   #备注
                                         )
  end
end
