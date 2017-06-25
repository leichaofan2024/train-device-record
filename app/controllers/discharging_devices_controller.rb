class DischargingDevicesController < ApplicationController
    def index
        @station = Station.find(params[:station_id])
        @discharging_devices = DischargingDevice.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
    end

    def show
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @discharging_device = DischargingDevice.find(params[:id])
    end

    def new
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @discharging_device = DischargingDevice.new
    end

    def create
        @discharging_device = DischargingDevice.new(discharging_device_params)
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

        @discharging_device.equipment_category_id = @equipment_category.id
        redirect_to station_path(current_station) if @discharging_device.save
    end

    def edit
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @discharging_device = DischargingDevice.find(params[:id])
    end

    def update
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @discharging_device = DischargingDevice.find(params[:id])
        @discharging_device.update(discharging_device_params)
        redirect_to equipment_category_discharging_device_path(@equipment_category, @discharging_device)
    end

    private

    def discharging_device_params
        params.require(:discharging_device).permit(
            :station_id,
            :equipment_category_id, #
            :factory_id, #
            :running_number, # 运行编号
            :standard, # 规格型号
            :voltage, # 工频电压（KV）
            :ability, # 自灭弧能力（KA）
            :c_ability, # 承受短路电流能力
            :manufacture_date, # 出厂日期
            :commissioning_date, # 投运日期
            :remark # 备注
        )
    end
end
