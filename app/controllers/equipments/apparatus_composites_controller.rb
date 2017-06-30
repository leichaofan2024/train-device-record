class Equipments::ApparatusCompositesController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @apparatus_composites = ApparatusComposite.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @apparatus_composite = ApparatusComposite.find(params[:id])
  end

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @apparatus_composite = ApparatusComposite.new
  end

  def create
    @apparatus_composite = ApparatusComposite.new(apparatus_composite_params)
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

    @apparatus_composite.equipment_category_id = @equipment_category.id
    if @apparatus_composite.save
      redirect_to station_path(current_station)
    end
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @apparatus_composite = ApparatusComposite.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @apparatus_composite = ApparatusComposite.find(params[:id])
    @apparatus_composite.update(apparatus_composite_params)
    redirect_to equipment_category_equipmnets_apparatus_composite_path(@equipment_category,@apparatus_composite)
  end

  private

  def apparatus_composite_params
    params.require(:apparatus_composite).permit(
                                          :station_id,
                                          :equipment_category_id,    #
                                          :factory_id,               #
                                          :running_number,            #运行编号
                                          :standard,                  #规格型号
                                          :rated_voltage,             #额定电压
                                          :manufacture_date,          #出厂日期
                                          :commissioning_date,        #投运日期
                                          :remark,                    #备注
    )
  end
end
