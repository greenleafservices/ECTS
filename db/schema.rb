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

ActiveRecord::Schema.define(version: 20170526134750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "csas", force: :cascade do |t|
    t.string   "cust_id"
    t.string   "csa"
    t.string   "equip_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "term"
    t.string   "equip_desc"
    t.decimal  "total_perks"
    t.integer  "equipment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "customer_id"
    t.index ["customer_id"], name: "index_csas_on_customer_id", using: :btree
    t.index ["equipment_id"], name: "index_csas_on_equipment_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "cust_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "st"
    t.string   "zip"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "cell_phone"
    t.string   "email"
    t.boolean  "auto_serv"
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equip_notes", force: :cascade do |t|
    t.string   "cust_id"
    t.string   "equip_id"
    t.text     "equip_notes"
    t.integer  "equipment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["equipment_id"], name: "index_equip_notes_on_equipment_id", using: :btree
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "cust_id"
    t.string   "equip_id"
    t.string   "csa1"
    t.string   "serial"
    t.string   "model"
    t.string   "manufacturer"
    t.string   "product_type"
    t.date     "date_installed"
    t.date     "last_service_date"
    t.integer  "recommended_service"
    t.date     "next_service_date"
    t.text     "equipment_notes"
    t.string   "warranty_policy"
    t.integer  "extended"
    t.string   "warranty_length"
    t.string   "warranty_type"
    t.date     "expiration_date"
    t.text     "warranty_notes"
    t.integer  "hide"
    t.integer  "customer_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "csa_id"
    t.index ["csa_id"], name: "index_equipment_on_csa_id", using: :btree
    t.index ["customer_id"], name: "index_equipment_on_customer_id", using: :btree
  end

  add_foreign_key "csas", "customers"
  add_foreign_key "csas", "equipment"
  add_foreign_key "equip_notes", "equipment"
  add_foreign_key "equipment", "csas"
  add_foreign_key "equipment", "customers"
end
