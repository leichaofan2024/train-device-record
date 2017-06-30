class Equipments::MoveRecordsController < ApplicationController
  def new
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.find(params[:transformer_id])
    @move_record = MoveRecord.new
  end

  def create
    @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
    @transformer = Transformer.find(params[:transformer_id])
    @move_record = MoveRecord.new(move_record_params)
    @move_record.transformer = @transformer
    if @move_record.save
      redirect_to equipment_category_equipments_transformer_path(@equipment_category,@transformer)
    else
      render :new
    end
  end


  private

  def move_record_params
    params.require(:move_record).permit(:transformer_id,
                                        :year,
                                        :operation_hours,
                                        :overload_time,
                                        :overload_cumulative_time,
                                        :utilize_percentage,
                                        :short_circuit_time,
                                        :record)
  end
end
