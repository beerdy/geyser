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

ActiveRecord::Schema.define(version: 20200124092958) do

  create_table "carts", force: :cascade do |t|
    t.string "session"
    t.string "product"
    t.integer "quantify"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "count"
    t.integer "product_id_id"
    t.index ["product_id_id"], name: "index_carts_on_product_id_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "url"
    t.string "link"
    t.integer "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.bigint "asset_file_size"
    t.datetime "asset_updated_at"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "url"
    t.string "link"
    t.integer "sort"
    t.boolean "slider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.integer "product_id"
    t.index ["product_id"], name: "index_galleries_on_product_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.integer "product_id"
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "slave"
    t.string "link"
    t.string "session"
    t.string "email"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "url"
    t.string "link"
    t.integer "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parthners", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "url"
    t.string "link"
    t.string "complectation_id"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
