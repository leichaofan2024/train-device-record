class TrendsDischargeCoilsController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @trends_discharge_coils = TrendsDischargeCoil.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_discharge_coil = TrendsDischargeCoil.find(params[:id])
  end

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_discharge_coil = TrendsDischargeCoil.new
  end

  def create
    @trends_discharge_coil = TrendsDischargeCoil.new(trends_discharge_coil_params)
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

    @trends_discharge_coil.equipment_category_id = @equipment_category.id
    if @trends_discharge_coil.save
      redirect_to station_path(current_station)
    end
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_discharge_coil = TrendsDischargeCoil.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_discharge_coil = TrendsDischargeCoil.find(params[:id])
    @trends_discharge_coil.update(trends_discharge_coil_params)
    redirect_to equipment_category_trends_discharge_coil_path(@equipment_category,@trends_discharge_coil)
  end

  private

  def trends_discharge_coil_params
    params.require(:trends_discharge_coil).permit(
                                          :station_id,
                                          :equipment_category_id,    #
                                          :factory_id,               #
                                          :running_number ,           #运行编号
                                          :standard  ,                #规格型号
                                          :voltage_persent,        #电压比
                                          :rated_voltage  ,           #额定电压
                                          :half_capacity ,     #0.5容量
                                          :one_capacity  ,    #1.0容量
                                          :three_capacity ,    #3.0容量
                                          :max_capacity  ,    #最大容量
                                          :insulation_oil ,           #绝缘油号
                                          :total_weight   ,           #总重
                                          :manufacture_date  ,        #出厂日期
                                          :manufacture_number ,       #出厂序号
                                          :commissioning_date  ,      #投运日期
                                          :remark ,                   #备注
)
  end
end
