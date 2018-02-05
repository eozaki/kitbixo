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

ActiveRecord::Schema.define(version: 20180205160823) do

  create_table "bixos", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.integer "curso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bixos_modalidades", id: false, force: :cascade do |t|
    t.integer "bixo_id"
    t.integer "modalidade_id"
    t.index ["bixo_id"], name: "index_bixos_modalidades_on_bixo_id"
    t.index ["modalidade_id"], name: "index_bixos_modalidades_on_modalidade_id"
  end

  create_table "modalidades", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendas", force: :cascade do |t|
    t.string "tamanho", default: "M", null: false
    t.string "cor", default: "Vermelho", null: false
    t.integer "bixo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bixo_id"], name: "index_vendas_on_bixo_id"
  end

end
