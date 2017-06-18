class EquipmentCategoriesController < ApplicationController

  def admin_index
    @equipment_categories = EquipmentCategory.all
  end

  def index
    @equipment_categories = current_station.equipment_categories
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:id])
    if @equipment_category.update(equipment_category_params)
      redirect_to admin_index_equipment_categories_path
    else
      render :edit
    end
  end

  def new
    @equipment_category= EquipmentCategory.new
  end

  def create
    @equipment_category= EquipmentCategory.new(equipment_category_params)
    @equipment_category.save
    redirect_to admin_index_equipment_categories_path
  end

  private

  def equipment_category_params
    params.require(:equipment_category).permit(:name, :description)
  end
end
