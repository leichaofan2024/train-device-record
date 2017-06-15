class EquipmentResumesController < ApplicationController

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.find(params[:transformer_id])
    @equipment_resume = EquipmentResume.new
  end

  def create
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.find(params[:transformer_id])
    @equipment_resume.transformer = @transformer
    @equipment_resume = EquipmentResume.new
    if @equipment_resume.save
      redirect_to transformers_path
    else
      render :new
    end
  end


  private

  def equipment_resume_params
    params.require(:equipment_category).permit()
  end

end
