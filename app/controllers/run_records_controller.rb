class RunRecordsController < ApplicationController
  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.find(params[:transformer_id])
    @run_record = RunRecord.new
  end

  def create
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.find(params[:transformer_id])
    @run_record = RunRecord.new
    if @run_record.save
      redirect_to equipment_category_transformer_path
    else
      render :new
    end
  end



  def update
  end

  private

  def run_record_params
    params.require(:run_record).permit(:transformer_id,
                                       :year,
                                       :operation_hours,
                                       :overload_times,
                                       :overload_cumulative_time,
                                       :utilize_percentage,
                                       :short_circuit_time,
                                       :record)
  end
end
