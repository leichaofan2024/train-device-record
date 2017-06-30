class Equipments::TrendsRegulatingTransformersController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @trends_regulating_transformers = TrendsRegulatingTransformer.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_regulating_transformer = TrendsRegulatingTransformer.find(params[:id])
  end

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_regulating_transformer = TrendsRegulatingTransformer.new
  end

  def create
    @trends_regulating_transformer = TrendsRegulatingTransformer.new(trends_regulating_transformer_params)
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

    @trends_regulating_transformer.equipment_category_id = @equipment_category.id
    if @trends_regulating_transformer.save
      redirect_to station_path(current_station)
    end
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_regulating_transformer = TrendsRegulatingTransformer.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @trends_regulating_transformer = TrendsRegulatingTransformer.find(params[:id])
    @trends_regulating_transformer.update(trends_regulating_transformer_params)
    redirect_to equipment_category_equipmnets_trends_regulating_transformer_path(@equipment_category,@trends_regulating_transformer)
  end

  private

  def trends_regulating_transformer_params
    params.require(:trends_regulating_transformer).permit(
                                          :station_id,
                                          :equipment_category_id,    #
                                          :factory_id,               #
                                          :running_number,            #运行编号
                                          :standard  ,                #规格型号
                                          :rated_voltage  ,           #额定电压
                                          :rated_current  ,           #额定电流
                                          :capacity   ,                  #容量
                                          :insulation_oil,            #绝缘油号
                                          :total_weight   ,           #总重
                                          :manufacture_date ,         #出厂日期
                                          :manufacture_number  ,      #出厂序号
                                          :commissioning_date,        #投运日期
                                          :remark ,                   #备注
)
  end
end
