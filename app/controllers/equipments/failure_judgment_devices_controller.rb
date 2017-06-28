class FailureJudgmentDevicesController < ApplicationController
    def index
        @station = Station.find(params[:station_id])
        @failure_judgment_devices = FailureJudgmentDevice.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
    end

    def show
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @failure_judgment_device = FailureJudgmentDevice.find(params[:id])
    end

    def new
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @failure_judgment_device = FailureJudgmentDevice.new
    end

    def create
        @failure_judgment_device = FailureJudgmentDevice.new(failure_judgment_device_params)
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

        @failure_judgment_device.equipment_category_id = @equipment_category.id
        redirect_to station_path(current_station) if @failure_judgment_device.save
    end

    def edit
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @failure_judgment_device = FailureJudgmentDevice.find(params[:id])
    end

    def update
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @failure_judgment_device = FailureJudgmentDevice.find(params[:id])
        @failure_judgment_device.update(failure_judgment_device_params)
        redirect_to equipment_category_failure_judgment_device_path(@equipment_category, @failure_judgment_device)
    end

    private

    def failure_judgment_device_params
        params.require(:failure_judgment_device).permit(
            :station_id,
            :equipment_category_id, #
            :factory_id, #
            :name, # 设备名称
            :running_number, # 运行编号
            :standard, # 规格型号
            :number, # RTU数量
            :control_number, # 控制群数量
            :manufacture_date, # 出厂日期
            :commissioning_date, # 投运日期
            :remark # 备注
        )
    end
end
