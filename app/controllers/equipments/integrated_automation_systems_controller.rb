class Equipments::IntegratedAutomationSystemsController < ApplicationController
  def index
      @station = Station.find(params[:station_id])
      @integrated_automation_systems = IntegratedAutomationSystem.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
  end

  def show
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @integrated_automation_system = IntegratedAutomationSystem.find(params[:id])
  end

  def new
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @integrated_automation_system = IntegratedAutomationSystem.new
  end

  def create
      @integrated_automation_system = IntegratedAutomationSystem.new(integrated_automation_system_params)
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @integrated_automation_system.station = current_station
      @integrated_automation_system.equipment_category_id = @equipment_category.id
      redirect_to station_path(current_station) if @integrated_automation_system.save
  end

  def edit
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @integrated_automation_system = IntegratedAutomationSystem.find(params[:id])
  end

  def update
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @integrated_automation_system = IntegratedAutomationSystem.find(params[:id])
      @integrated_automation_system.update(integrated_automation_system_params)
      redirect_to equipment_category_equipmnets_integrated_automation_system_path(@equipment_category, @integrated_automation_system)
  end

  private

  def integrated_automation_system_params
      params.require(:integrated_automation_system).permit(
          :station_id,
          :equipment_category_id, #
          :factory_id, #
          :standard, # 规格型号
          :manufacture_number, # 出厂序号
          :manufacture_date, # 出厂日期
          :commissioning_date, # 投运日期
          :remark # 备注
      )
  end
end
