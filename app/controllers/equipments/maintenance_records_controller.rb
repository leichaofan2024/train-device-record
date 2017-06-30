class Equipments::MaintenanceRecordsController < ApplicationController

    def new
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @transformer = Transformer.find(params[:transformer_id])
      @maintenance_record = MaintenanceRecord.new
    end

    def create
      @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
      @transformer = Transformer.find(params[:transformer_id])
      @maintenance_record = MaintenanceRecord.new(maintenance_record_params)
      @maintenance_record.transformer = @transformer
      if @maintenance_record.save
        redirect_to equipment_category_equipments_transformer_path(@equipment_category,@transformer)
      else
        render :new
      end
    end


    private

    def maintenance_record_params
      params.require(:maintenance_record).permit(:transformer_id,
                                                 :date,               #日期
                                                 :maintenance_process ,      #维程
                                                 :maintenance_unit,         #承修单位
                                                 :cost,            #费用
                                                 :overhaul_incharge ,               #检修负责人
                                                 :major_defects ,           #主要缺陷
                                                 :maintenance_situation ,   )
    end
end
