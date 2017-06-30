class Equipments::OtherTranEquipmentsController < ApplicationController
  def index
      @station = Station.find(params[:station_id])
      @other_tran_equipments = OtherTranEquipment.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
  end

  def show
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @other_tran_equipment = OtherTranEquipment.find(params[:id])
  end

  def new
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @other_tran_equipment = OtherTranEquipment.new
  end

  def create
      @other_tran_equipment = OtherTranEquipment.new(other_tran_equipment_params)
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

      @other_tran_equipment.equipment_category_id = @equipment_category.id
      redirect_to station_path(current_station) if @other_tran_equipment.save
  end

  def edit
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @other_tran_equipment = OtherTranEquipment.find(params[:id])
  end

  def update
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @other_tran_equipment = OtherTranEquipment.find(params[:id])
      @other_tran_equipment.update(other_tran_equipment_params)
      redirect_to equipment_category_equipmnets_other_tran_equipment_path(@equipment_category, @other_tran_equipment)
  end

  private

  def other_tran_equipment_params
      params.require(:other_tran_equipment).permit(
          :station_id,
          :equipment_category_id, #
          :factory_id, #
          :name, # 设备名称
          :running_number,            # 运行编号
          :standard,                  # 规格型号
          :manufacture_number, # 出厂序号
          :manufacture_date, # 出厂日期
          :commissioning_date, # 投运日期
          :remark # 备注
      )
  end
end
