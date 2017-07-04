class Equipments::CurrentTransformersController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @current_transformers = CurrentTransformer.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @current_transformer = CurrentTransformer.find(params[:id])
  end

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @current_transformer = CurrentTransformer.new
  end

  def create
    @current_transformer = CurrentTransformer.new(current_transformer_params)
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @current_transformer.station = current_station

    @current_transformer.equipment_category_id = @equipment_category.id
    if @current_transformer.save
      redirect_to station_path(current_station)
    end
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @current_transformer = CurrentTransformer.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @current_transformer = CurrentTransformer.find(params[:id])
    @current_transformer.update(current_transformer_params)
    redirect_to equipment_category_equipmnets_current_transformer_path(@equipment_category,@current_transformer)
  end

  private

  def current_transformer_params
    params.require(:current_transformer).permit(
                                              :station_id,
                                              :equipment_category_id,    #
                                              :factory_id,               #
                                              :running_number,            #运行编号
                                              :standard,                  #规格型号
                                              :rated_voltage ,            #额定电压
                                              :rated_current ,            #额定电流
                                              :insulation_oil  ,          #绝缘油号
                                              :total_weight  ,            #总重
                                              :current_persent ,      #电流比
                                              :first_class_coil ,                 #线圈一等级
                                              :first_coil_load ,                    #线圈一等级负荷
                                              :second_class_coil,                  #线圈二等级
                                              :second_coil_load ,                  #线圈二等级负
                                               )
  end
end
