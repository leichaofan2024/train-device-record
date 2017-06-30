class Equipments::CircuitBreakersController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @circuit_breakers = CircuitBreaker.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @circuit_breaker = CircuitBreaker.find(params[:id])
  end

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @circuit_breaker = CircuitBreaker.new
  end

  def create
    @circuit_breaker = CircuitBreaker.new(circuit_breaker_params)
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

    @circuit_breaker.equipment_category_id = @equipment_category.id
    if @circuit_breaker.save
      redirect_to station_path(current_station)
    end
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @circuit_breaker = CircuitBreaker.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @circuit_breaker = CircuitBreaker.find(params[:id])
    @circuit_breaker.update(circuit_breaker_params)
    redirect_to equipment_category_equipmnets_circuit_breaker_path(@equipment_category,@circuit_breaker)
  end

  private

  def circuit_breaker_params
    params.require(:circuit_breaker).permit(
                                          :station_id,
                                          :equipment_category_id,    #
                                          :factory_id,               #
                                          :running_number,            #运行编号
                                          :standard,                  #规格型号
                                          :rated_voltage,             #额定电压
                                          :orgnization_model,     #机构型号
                                          :rated_current,             #额定电流
                                          :rated_short,         #额定短路
                                          :orgnization_sort,   #机构类别
                                          :current_transformer_type,      #流互型号
                                          :current_transformer_percent,    #流互变比
                                          :gas_pressure,     # 气体压力
                                          :total_weight,              #总重
                                          :status,                    #状态
                                          :manufacture_number,        #出厂序号
                                          :manufacture_date,          #出厂日期
                                          :commissioning_date,        #投运日期
                                          :remark,                    #备注
)
  end
end
