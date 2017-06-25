# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170625093245) do

  create_table "apparatus_composites", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "rated_voltage"
    t.string   "standard"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "batteries", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "standard"
    t.string   "number"
    t.string   "rated_voltage"
    t.string   "single_voltage"
    t.string   "rated_capacity"
    t.string   "category"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "busbars", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "standard"
    t.string   "environment"
    t.string   "length"
    t.string   "category"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "cable_ones", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "standard"
    t.string   "rated_voltage"
    t.string   "length"
    t.string   "category"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "circuit_breakers", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.string   "rated_voltage"
    t.string   "orgnization_model"
    t.string   "rated_current"
    t.string   "rated_short"
    t.string   "orgnization_sort"
    t.string   "current_transformer_type"
    t.string   "current_transformer_percent"
    t.string   "gas_pressure"
    t.string   "total_weight"
    t.string   "status"
    t.string   "manufacture_number"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "composite_apparatus", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "rated_voltage"
    t.string   "standard"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "current_transformers", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.string   "rated_voltage"
    t.string   "rated_current"
    t.string   "insulation_oil"
    t.string   "total_weight"
    t.string   "current_persent"
    t.string   "first_class_coil"
    t.string   "first_coil_load"
    t.string   "second_class_coil"
    t.string   "second_coil_load"
    t.string   "status"
    t.date     "manufacture_date"
    t.string   "manufacture_number"
    t.date     "commissioning_date"
    t.string   "remark"
    t.string   "category_one"
    t.string   "category_two"
    t.string   "year"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "discharge_coils", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.string   "voltage_persent"
    t.string   "rated_voltage"
    t.string   "half_capacity"
    t.string   "one_capacity"
    t.string   "three_capacity"
    t.string   "max_capacity"
    t.string   "insulation_oil"
    t.string   "total_weight"
    t.date     "manufacture_date"
    t.string   "manufacture_number"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "discharging_devices", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "standard"
    t.string   "running_number"
    t.string   "voltage"
    t.string   "ability"
    t.string   "c_ability"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "equipment_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  create_table "factories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "failure_judgment_devices", force: :cascade do |t|
    t.string   "running_number"
    t.string   "standard"
    t.integer  "number"
    t.integer  "control_number"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "gis_cupboards", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "standard"
    t.string   "running_number"
    t.string   "rated_voltage"
    t.string   "main_part"
    t.string   "manufacture_number"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "inductors", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.string   "rated_voltage"
    t.string   "rated_current"
    t.string   "capacity"
    t.string   "manufacture_number"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "insulation_devices", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "standard"
    t.string   "detecting_instrument"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "integrated_automation_systems", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "standard"
    t.string   "manufacture_number"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "isolate_switches", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.string   "rated_voltage"
    t.string   "rated_current"
    t.string   "status"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "lightning_rods", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.string   "height"
    t.string   "category"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "load_switches", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.string   "rated_voltage"
    t.string   "rated_current"
    t.string   "orgnization_model"
    t.date     "manufacture_date"
    t.string   "manufacture_number"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "low_voltage_cabinets", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "name"
    t.string   "pan_name_standard"
    t.string   "manufacture_number"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "maintenance_records", force: :cascade do |t|
    t.integer  "transformer_id"
    t.string   "date"
    t.string   "maintenance_process"
    t.string   "maintenance_unit"
    t.string   "cost"
    t.string   "overhaul_incharge"
    t.string   "major_defects"
    t.string   "maintenance_situation"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "move_records", force: :cascade do |t|
    t.date     "year"
    t.string   "operation_hours"
    t.string   "overload_time"
    t.string   "overload_cumulative_time"
    t.string   "utilize_percentage"
    t.string   "short_circuit_time"
    t.string   "run_record"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "transformer_id"
  end

  create_table "other_tran_equipments", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "name"
    t.string   "running_number"
    t.string   "standard"
    t.string   "manufacture_number"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "potential_transformers", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.string   "voltage_persent"
    t.string   "rated_voltage"
    t.string   "phase"
    t.string   "half_capacity"
    t.string   "one_capacity"
    t.string   "three_capacity"
    t.string   "max_capacity"
    t.string   "insulation_oil"
    t.string   "total_weight"
    t.date     "manufacture_date"
    t.string   "manufacture_number"
    t.date     "commissioning_date"
    t.string   "remark"
    t.string   "category_one"
    t.string   "category_two"
    t.string   "year"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "power_supplies", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "standard"
    t.string   "rated_voltage"
    t.string   "rated_current"
    t.string   "way"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "quanlity_authanticate_records", force: :cascade do |t|
    t.integer  "transformer_id"
    t.string   "year"
    t.string   "grade"
    t.string   "major_defects"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "ray_resistance_rings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "remote_action_systems", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "standard"
    t.integer  "number"
    t.integer  "control_number"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "shunt_capacitors", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.integer  "count"
    t.string   "rated_voltage"
    t.string   "rated_capacity"
    t.string   "rated_current"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "station_equipment_ships", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surge_arresters", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.string   "rated_voltage"
    t.string   "casing"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "category"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "terminal_boxes", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "main_equipment"
    t.string   "category"
    t.string   "environment"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "transformer_shift_records", force: :cascade do |t|
    t.integer  "transformer_id"
    t.date     "shift_in_date"
    t.string   "shift_reason"
    t.string   "shift_out_company"
    t.date     "shift_out_agent"
    t.string   "reciving_company"
    t.string   "shift_in_agent"
    t.date     "commissioning_date"
    t.string   "breakdown_record"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "transformers", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "standard"
    t.string   "running_number"
    t.string   "rated_voltage"
    t.string   "rated_current"
    t.string   "rated_volume"
    t.string   "phase"
    t.string   "connection_group"
    t.string   "cooling_method"
    t.string   "noload_current"
    t.string   "noload_loss"
    t.string   "short_circuit_loss"
    t.string   "impedance_voltage"
    t.string   "insulation_oil"
    t.string   "oil_weight"
    t.string   "suttle"
    t.string   "affix_weight"
    t.string   "total_weight"
    t.string   "status"
    t.date     "manufacture_date"
    t.string   "manufacture_number"
    t.date     "installation_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "tapping_switch"
    t.float    "lowside_current"
    t.float    "lowside_voltage"
    t.float    "highside_current"
    t.float    "highside_voltage"
    t.string   "ancillary_device"
    t.string   "connection_diagram"
  end

  create_table "trends_controllable_valves", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.string   "rated_voltage"
    t.string   "rated_current"
    t.string   "cooling_method"
    t.string   "total_weight"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "trends_discharge_coils", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.string   "voltage_persent"
    t.string   "rated_voltage"
    t.string   "half_capacity"
    t.string   "one_capacity"
    t.string   "three_capacity"
    t.string   "max_capacity"
    t.string   "insulation_oil"
    t.string   "total_weight"
    t.date     "manufacture_date"
    t.string   "manufacture_number"
    t.date     "commissioning_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "remark"
  end

  create_table "trends_inductors", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "category"
    t.string   "standard"
    t.integer  "count"
    t.string   "rated_voltage"
    t.string   "rated_current"
    t.string   "capacity"
    t.string   "manufacture_number"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "trends_regulating_transformers", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.string   "rated_voltage"
    t.string   "rated_current"
    t.string   "capacity"
    t.string   "insulation_oil"
    t.string   "total_weight"
    t.date     "manufacture_date"
    t.string   "manufacture_number"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "trends_shunt_capacitors", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.integer  "count"
    t.string   "rated_voltage"
    t.string   "rated_capacity"
    t.string   "rated_volume"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "trends_valve_controllables", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "running_number"
    t.string   "standard"
    t.string   "rated_voltage"
    t.string   "rated_current"
    t.string   "cooling_method"
    t.string   "total_weight"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "station_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "v_stop_sies", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "standard"
    t.integer  "wen_control_number"
    t.integer  "control_number"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "video_monitoring_systems", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "equipment_category_id"
    t.integer  "factory_id"
    t.string   "manufacture_number"
    t.date     "manufacture_date"
    t.date     "commissioning_date"
    t.string   "remark"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
