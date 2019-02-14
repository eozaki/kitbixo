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

ActiveRecord::Schema.define(version: 20190214193750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bixos", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.integer "curso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "tutorship", default: false
  end

  create_table "bixos_modalidades", id: false, force: :cascade do |t|
    t.bigint "bixo_id"
    t.bigint "modalidade_id"
    t.index ["bixo_id"], name: "index_bixos_modalidades_on_bixo_id"
    t.index ["modalidade_id"], name: "index_bixos_modalidades_on_modalidade_id"
  end

  create_table "confirmations", force: :cascade do |t|
    t.bigint "bixo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bixo_id"], name: "index_confirmations_on_bixo_id"
  end

  create_table "modalidades", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pagamentos", force: :cascade do |t|
    t.decimal "valor"
    t.bigint "venda_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "veterano_id"
    t.index ["venda_id"], name: "index_pagamentos_on_venda_id"
    t.index ["veterano_id"], name: "index_pagamentos_on_veterano_id"
  end

  create_table "vendas", force: :cascade do |t|
    t.bigint "bixo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cor"
    t.integer "tamanho"
    t.boolean "caneca"
    t.index ["bixo_id"], name: "index_vendas_on_bixo_id"
  end

  create_table "veteranos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "confirmations", "bixos"
  add_foreign_key "pagamentos", "veteranos"
end
