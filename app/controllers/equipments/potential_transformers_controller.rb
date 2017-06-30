class Equipments::PotentialTransformersController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @potential_transformers = PotentialTransformer.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @potential_transformer = PotentialTransformer.find(params[:id])
  end

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @potential_transformer = PotentialTransformer.new
  end

  def create
    @potential_transformer = PotentialTransformer.new(potential_transformer_params)
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

    @potential_transformer.equipment_category_id = @equipment_category.id
    if @potential_transformer.save
      redirect_to station_path(current_station)
    end
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @potential_transformer = PotentialTransformer.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @potential_transformer = PotentialTransformer.find(params[:id])
    @potential_transformer.update(potential_transformer_params)
    redirect_to equipment_category_equipmnets_potential_transformer_path(@equipment_category,@potential_transformer)
  end

  private

  def potential_transformer_params
    params.require(:potential_transformer).permit(
                                          :station_id,
                                          :equipment_category_id,    #
                                          :factory_id,               #
                                          :running_number,            #运行编号
                                          :standard ,                 #规格型号
                                          :voltage_persent ,       #电压比
                                          :rated_voltage ,            #额定电压
                                          :phase ,                    #相数
                                          :half_capacity,      #0.5容量
                                          :one_capacity ,     #1.0容量
                                          :three_capacity ,    #3.0容量
                                          :max_capacity ,     #最大容量
                                          :insulation_oil ,           #绝缘油号
                                          :total_weight  ,            #总重
                                          :manufacture_date ,         #出厂日期
                                          :manufacture_number ,       #出厂序号
                                          :commissioning_date  ,      #投运日期
                                          :remark  ,                  #备注
                                          :category_one ,       #设备分类一
                                          :category_two ,       #设备分类二
                                          :year ,                 #年度
)
  end
end
