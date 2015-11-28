# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151127184515) do

  create_table "mascota", force: :cascade do |t|
    t.integer  "sexo"
    t.integer  "edad"
    t.string   "tamano"
    t.string   "raza"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "nombre"
    t.string   "tipoid"
    t.integer  "numeroid"
    t.date     "fnacimiento"
    t.integer  "tel"
    t.string   "dir"
    t.string   "departamento"
    t.string   "ciudad"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "usuario"
    t.string   "password"
    t.boolean  "admin"
  end

end
