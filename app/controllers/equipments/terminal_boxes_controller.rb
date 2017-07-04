class Equipments::TerminalBoxesController < ApplicationController
  def index
      @station = Station.find(params[:station_id])
      @terminal_boxs = TerminalBox.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
  end

  def show
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @terminal_box = TerminalBox.find(params[:id])
  end

  def new
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @terminal_box = TerminalBox.new
  end

  def create
      @terminal_box = TerminalBox.new(terminal_box_params)
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @terminal_box.station = current_station
      @terminal_box.equipment_category_id = @equipment_category.id
      redirect_to station_path(current_station) if @terminal_box.save
  end

  def edit
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @terminal_box = TerminalBox.find(params[:id])
  end

  def update
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @terminal_box = TerminalBox.find(params[:id])
      @terminal_box.update(terminal_box_params)
      redirect_to equipment_category_equipmnets_terminal_box_path(@equipment_category, @terminal_box)
  end

  private

  def terminal_box_params
      params.require(:terminal_box).permit(
          :station_id,
          :equipment_category_id, #
          :factory_id, #
          :running_number, # 运行编号
          :main_equipment, # 主要设备构成
          :category,                 # 类型
          :environment,              # 工作环境
          :manufacture_date, # 出厂日期
          :commissioning_date, # 投运日期
          :remark # 备注
      )
  end
end
