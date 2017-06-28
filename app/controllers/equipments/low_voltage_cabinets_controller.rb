class LowVoltageCabinetsController < ApplicationController
    def index
        @station = Station.find(params[:station_id])
        @low_voltage_cabinets = LowVoltageCabinet.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
    end

    def show
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @low_voltage_cabinet = LowVoltageCabinet.find(params[:id])
    end

    def new
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @low_voltage_cabinet = LowVoltageCabinet.new
    end

    def create
        @low_voltage_cabinet = LowVoltageCabinet.new(low_voltage_cabinet_params)
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

        @low_voltage_cabinet.equipment_category_id = @equipment_category.id
        redirect_to station_path(current_station) if @low_voltage_cabinet.save
    end

    def edit
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @low_voltage_cabinet = LowVoltageCabinet.find(params[:id])
    end

    def update
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @low_voltage_cabinet = LowVoltageCabinet.find(params[:id])
        @low_voltage_cabinet.update(low_voltage_cabinet_params)
        redirect_to equipment_category_low_voltage_cabinet_path(@equipment_category, @low_voltage_cabinet)
    end

    private

    def low_voltage_cabinet_params
        params.require(:low_voltage_cabinet).permit(
            :station_id,
            :equipment_category_id, #
            :factory_id, #
            :name, # 设备名称
            :pan_name_standard, # 盘上设备主要名称及型号
            :manufacture_number, # 出厂序号
            :manufacture_date, # 出厂日期
            :commissioning_date, # 投运日期
            :remark # 备注
        )
    end
end
