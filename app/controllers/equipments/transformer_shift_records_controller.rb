class Equipments::TransformerShiftRecordsController < ApplicationController
  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.find(params[:transformer_id])
    @transformer_shift_record = TransformerShiftRecord.new
  end

  def create
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.find(params[:transformer_id])
    @transformer_shift_record = TransformerShiftRecord.new(transformer_shift_record_params)
    @transformer_shift_record.transformer = @transformer
    if @transformer_shift_record.save
      redirect_to equipment_category_equipments_transformer_path(@equipment_category,@transformer)
    else
      render :new
    end
  end


  private

  def transformer_shift_record_params
    params.require(:transformer_shift_record).permit(:transformer_id,
                                        :shift_in_date,
                                        :shift_reason,
                                        :shift_out_company,
                                        :shift_out_agent,
                                        :reciving_company,
                                        :shift_in_agent,
                                        :commissioning_date,
                                        :breakdown_record)
  end
end
