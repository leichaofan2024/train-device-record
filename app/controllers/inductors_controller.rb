class InductorsController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @inductors = Inductor.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @inductor = Inductor.find(params[:id])
  end

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @inductor = Inductor.new
  end

  def create
    @inductor = Inductor.new(inductor_params)
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

    @inductor.equipment_category_id = @equipment_category.id
    if @inductor.save
      redirect_to station_path(current_station)
    end
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @inductor = Inductor.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @inductor = Inductor.find(params[:id])
    @inductor.update(inductor_params)
    redirect_to equipment_category_inductor_path(@equipment_category,@inductor)
  end

  private

  def inductor_params
    params.require(:inductor).permit(
                                              :station_id,
                                              :equipment_category_id,    #
                                              :factory_id,               #
                                              :running_number,            #运行编号
                                              :standard,                  #规格型号
                                              :rated_voltage ,            #额定电压
                                              :rated_current ,            #额定电流
                                              :capacity  ,                   #容量
                                              :manufacture_number,        #出厂序号
                                              :manufacture_date  ,        #出厂日期
                                              :commissioning_date ,       #投运日期
                                              :remark  ,                  #备注
                                               )
  end
end
