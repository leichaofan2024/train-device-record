class EquipmentCategoriesController < ApplicationController
  def index
    @equipment_categories = EquipmentCategory.all
  end

  def edit
    @equipment_category = EquipmentCategory.find(params[:id])
  end

  def update
    @equipment_category = EquipmentCategory.find(params[:id])
    if @equipment_category.update(equipment_category_params)
      redirect_to equipment_categories_path
    else
      render :edit
    end
  end

  def create
    @equipment_category= EquipmentCategory.new(equipment_category_params)
    @equipment_category.save
    redirect_to stations_path
  end

  private

  def equipment_category_params
    params.require(:equipment_category).permit(:name, :description)
  end
end
