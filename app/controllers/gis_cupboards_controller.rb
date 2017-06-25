class GisCupboardsController < ApplicationController
    def index
        @station = Station.find(params[:station_id])
        @gis_cupboards = GisCupboard.all.where(station_id: params[:station_id], equipment_category_id: params[:equipment_category_id])
    end

    def show
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @gis_cupboard = GisCupboard.find(params[:id])
    end

    def new
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @gis_cupboard = GisCupboard.new
    end

    def create
        @gis_cupboard = GisCupboard.new(gis_cupboard_params)
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])

        @gis_cupboard.equipment_category_id = @equipment_category.id
        redirect_to station_path(current_station) if @gis_cupboard.save
    end

    def edit
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @gis_cupboard = GisCupboard.find(params[:id])
    end

    def update
        @equipment_category = EquipmentCategory.find(params[:equipment_category_id])
        @gis_cupboard = GisCupboard.find(params[:id])
        @gis_cupboard.update(gis_cupboard_params)
        redirect_to equipment_category_gis_cupboard_path(@equipment_category, @gis_cupboard)
    end

    private

    def gis_cupboard_params
        params.require(:gis_cupboard).permit(
            :station_id,
            :equipment_category_id, #
            :factory_id, #
            :running_number, # 运行编号
            :standard, # 规格型号
            :rated_voltage, # 额定电压
            :main_part, # 主要部件构成
            :manufacture_number, # 出厂序号
            :manufacture_date, # 出厂日期
            :commissioning_date, # 投运日期
            :remark # 备注
        )
    end
end
