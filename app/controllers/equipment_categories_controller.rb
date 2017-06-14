class EquipmentCategoriesController < ApplicationController
  def index
    @equipment_categories = EquipmentCategory.all
  end 
  def create
    @equipment_category= EquipmentCategory.new(equipment_category_params)
    @equipment_category.save
    redirect_to stations_path
  end

  private

  def equipment_category_params
    params.require(:equipment_category).permit(:name)
  end
end
