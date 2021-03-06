class Equipments::TrendsInductorsController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @trends_inductors = TrendsInductor.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_inductor = TrendsInductor.find(params[:id])
  end

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_inductor = TrendsInductor.new
  end

  def create
    @trends_inductor = TrendsInductor.new(trends_inductor_params)
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_inductor.station = current_station
    @trends_inductor.equipment_category_id = @equipment_category.id
    if @trends_inductor.save
      redirect_to station_path(current_station)
    end
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_inductor = TrendsInductor.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_inductor = TrendsInductor.find(params[:id])
    @trends_inductor.update(trends_inductor_params)
    redirect_to equipment_category_equipmnets_trends_inductor_path(@equipment_category,@trends_inductor)
  end

  private

  def trends_inductor_params
    params.require(:trends_inductor).permit(
                                          :station_id,
                                          :equipment_category_id,    #
                                          :factory_id,               #
                                          :running_number ,           #运行编号
                                          :category ,                #类型
                                          :standard ,                 #规格型号
                                          :count ,                #数量
                                          :rated_voltage,             #额定电压
                                          :rated_current,             #额定电流
                                          :capacity ,                    #容量
                                          :manufacture_number ,       #出厂序号
                                          :manufacture_date ,         #出厂日期
                                          :commissioning_date ,       #投运日期
                                          :remark ,                   #备注
                                         )
  end
end
