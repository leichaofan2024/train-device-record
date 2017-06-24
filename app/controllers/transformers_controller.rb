class TransformersController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @transformers = Transformer.all.where(station_id: params[:station_id],equipment_category_id: params[:equipment_category_id])
  end

  def show
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.find(params[:id])
  end

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.new
  end

  def create
    @transformer = Transformer.new(transformer_params)
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

    @transformer.equipment_category_id = @equipment_category.id
    if @transformer.save
      redirect_to station_path(current_station)
    end
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.find(params[:id])
    @transformer.update(transformer_params)
    redirect_to equipment_category_transformer_path(@equipment_category,@transformer)
  end

  private 

  def transformer_params
    params.require(:transformer).permit(
           :station_id            ,
           :equipment_category_id ,   #
           :factory_id            ,   #
           :standard              ,    #规格型号
           :running_number        ,    #运行编号
           :rated_voltage         ,    #额定电压
           :rated_current         ,    #额定电流
           :rated_volume          ,   #额定电容
           :phase                 ,    #相数
           :connection_group      ,    #接线组别
           :cooling_method        ,    #冷却方式
           :noload_current        ,    #空载电流
           :noload_loss           ,    #空载损耗
           :short_circuit_loss    ,    #短路损耗
           :impedance_voltage     ,    #阻抗电压
           :insulation_oil        ,    #绝缘油号
           :oil_weight            ,    #油重
           :suttle                ,    #器身重
           :affix_weight          ,    #附件重
           :total_weight          ,   #总重
           :status                ,   #状态
           :manufacture_date      ,    #出厂日期
           :manufacture_number    ,    #出厂序号
           :installation_date     ,    #安装日期
           :commissioning_date    ,   #投运日期
           :remark                ,
           :tapping_switch        ,
           :lowside_current       ,
           :lowside_voltage       ,
           :highside_current      ,
           :highside_voltage      ,
           :ancillary_device      ,
           :connection_diagram )
  end

end
