class Equipments::ShuntCapacitorsController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @shunt_capacitors = ShuntCapacitor.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @shunt_capacitor = ShuntCapacitor.find(params[:id])
  end

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @shunt_capacitor = ShuntCapacitor.new
  end

  def create
    @shunt_capacitor = ShuntCapacitor.new(shunt_capacitor_params)
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @shunt_capacitor.station = current_station
    @shunt_capacitor.equipment_category_id = @equipment_category.id
    if @shunt_capacitor.save
      redirect_to station_path(current_station)
    end
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @shunt_capacitor = ShuntCapacitor.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @shunt_capacitor = ShuntCapacitor.find(params[:id])
    @shunt_capacitor.update(shunt_capacitor_params)
    redirect_to equipment_category_equipmnets_shunt_capacitor_path(@equipment_category,@shunt_capacitor)
  end

  private

  def shunt_capacitor_params
    params.require(:shunt_capacitor).permit(
                                          :station_id,
                                          :equipment_category_id,    #
                                          :factory_id,               #
                                          :running_number,            #运行编号
                                          :standard ,                 #规格型号
                                          :count   ,              #数量
                                          :rated_voltage ,            #额定电压
                                          :rated_capacity ,          #额定容量
                                          :rated_current ,              #额定电流
                                          :manufacture_date ,         #出厂日期
                                          :commissioning_date  ,      #投运日期
                                          :remark   ,                 #备注
                                         )
  end
end
