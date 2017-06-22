class WorkingRecordsController < ApplicationController

  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.find(params[:transformer_id])
    @working_record = WorkingRecord.new
  end

  def create
    @equipment_category = EquipmentCategory.find(params[:equiment_category_id])
    @transformer = Transformer.find(params[:transformer_id])
    @working_record = WorkingRecord.new
    @working_record.transformer = @transformer
    if @working_record.save
      redirect_to equipment_category_transformer_working_record_path(@equipment_category,@transformer)
    else
      render :new
    end
  end

  def working_record_params
    params.require(:working_record).permit(
           :transformer_id,
           :year,
           :operation_hours,
           :overload_times,
           :overload_cumulative_time,
           :utilize_percentage,
           :short_circuit_time,
           :record   )
  end
end
