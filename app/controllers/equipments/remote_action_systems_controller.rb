class RemoteActionSystemsController < ApplicationController
    def index
        @station = Station.find(params[:station_id])
        @remote_action_systems = RemoteActionSystem.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
    end

    def show
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @remote_action_system = RemoteActionSystem.find(params[:id])
    end

    def new
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @remote_action_system = RemoteActionSystem.new
    end

    def create
        @remote_action_system = RemoteActionSystem.new(remote_action_system_params)
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

        @remote_action_system.equipment_category_id = @equipment_category.id
        redirect_to station_path(current_station) if @remote_action_system.save
    end

    def edit
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @remote_action_system = RemoteActionSystem.find(params[:id])
    end

    def update
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @remote_action_system = RemoteActionSystem.find(params[:id])
        @remote_action_system.update(remote_action_system_params)
        redirect_to equipment_category_remote_action_system_path(@equipment_category, @remote_action_system)
    end

    private

    def remote_action_system_params
        params.require(:remote_action_system).permit(
            :station_id,
            :equipment_category_id, #
            :factory_id, #
            :standard, # 规格型号
            :number, # RTU数量
            :control_number, # 控制群数量
            :manufacture_date, # 出厂日期
            :commissioning_date, # 投运日期
            :remark # 备注
        )
    end
end
