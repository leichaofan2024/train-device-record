class QuanlityAuthanticateRecordsController < ApplicationController
  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.find(params[:transformer_id])
    @quanlity_authanticate_record = QuanlityAuthanticateRecord.new
  end

  def create
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.find(params[:transformer_id])
    @quanlity_authanticate_record = QuanlityAuthanticateRecord.new(quanlity_authanticate_record_params)
    @quanlity_authanticate_record.transformer = @transformer
    if @quanlity_authanticate_record.save
      redirect_to equipment_category_transformer_path(@equipment_category,@transformer)
    else
      render :new
    end
  end



  def update
  end

  private

  def quanlity_authanticate_record_params
    params.require(:quanlity_authanticate_record).permit(:transformer_id,:year,:grade,:major_defects)
  end

end
