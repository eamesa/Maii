# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_28_041009) do

  create_table "admins", force: :cascade do |t|
    t.string "nombre_admin"
    t.string "tipo_admin"
    t.string "codigo_admin"
    t.integer "fondos_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fondos", force: :cascade do |t|
    t.string "nombre_fondo"
    t.integer "admin_id"
    t.string "tipo_fondo"
    t.string "codigo_tipo_fondo"
    t.string "codigo_fondo"
    t.integer "tipo_participaciones_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_fondos_on_admin_id"
  end

  create_table "parts", force: :cascade do |t|
    t.integer "fondo_id"
    t.integer "codigo_participaciones"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fondo_id"], name: "index_parts_on_fondo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "portfolios_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "fondos", "admins"
  add_foreign_key "parts", "fondos"
end
