class MaintenanceRecordsController < ApplicationController

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    
end
