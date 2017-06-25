class VStopSiesController < ApplicationController
    def index
        @station = Station.find(params[:station_id])
        @v_stop_syss = VStopSies.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
    end

    def show
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @v_stop_sys = VStopSies.find(params[:id])
    end

    def new
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @v_stop_sys = VStopSies.new
    end

    def create
        @v_stop_sys = VStopSies.new(v_stop_sys_params)
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

        @v_stop_sys.equipment_category_id = @equipment_category.id
        redirect_to station_path(current_station) if @v_stop_sys.save
    end

    def edit
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @v_stop_sys = VStopSies.find(params[:id])
    end

    def update
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @v_stop_sys = VStopSies.find(params[:id])
        @v_stop_sys.update(v_stop_sys_params)
        redirect_to equipment_category_v_stop_sys_path(@equipment_category, @v_stop_sys)
    end

    private

    def v_stop_sys_params
        params.require(:v_stop_sys).permit(
            :station_id,
            :equipment_category_id, #
            :factory_id, #
            :standard, # 规格型号
            :wen_control_number, # 温控柜数量
            :control_number, # 控制群数量
            :manufacture_date, # 出厂日期
            :commissioning_date, # 投运日期
            :remark # 备注
        )
    end
end
