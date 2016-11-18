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

ActiveRecord::Schema.define(version: 20161102175716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.integer  "state_id"
    t.string   "name"
    t.boolean  "enabled"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_cities_on_deleted_at", using: :btree
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "commerces", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.boolean  "enabled"
    t.datetime "deleted_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["deleted_at"], name: "index_commerces_on_deleted_at", using: :btree
  end

  create_table "models", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "name"
    t.string   "power"
    t.string   "max_useful_power"
    t.boolean  "security_brake"
    t.string   "engine_type"
    t.string   "chassis"
    t.string   "case_width"
    t.string   "cutting_height"
    t.string   "wheels"
    t.string   "collector_capacity"
    t.string   "cutting_surface"
    t.boolean  "enabled"
    t.datetime "deleted_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "weight"
    t.string   "packaging"
    t.string   "engine_mounted_on"
    t.string   "reel_type"
    t.string   "use"
    t.string   "reel_diameter"
    t.string   "tube"
    t.string   "cutting_width"
    t.string   "includes"
    t.string   "color"
    t.string   "fuel_capacity"
    t.string   "housing_thickness"
    t.string   "documentation_file_name"
    t.string   "documentation_content_type"
    t.integer  "documentation_file_size"
    t.datetime "documentation_updated_at"
    t.string   "specification_file_name"
    t.string   "specification_content_type"
    t.integer  "specification_file_size"
    t.datetime "specification_updated_at"
    t.index ["deleted_at"], name: "index_models_on_deleted_at", using: :btree
    t.index ["product_id"], name: "index_models_on_product_id", using: :btree
  end

  create_table "office_phones", force: :cascade do |t|
    t.string   "phone_type"
    t.string   "number"
    t.string   "notes"
    t.boolean  "enabled"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "office_id"
    t.index ["deleted_at"], name: "index_office_phones_on_deleted_at", using: :btree
    t.index ["office_id"], name: "index_office_phones_on_office_id", using: :btree
  end

  create_table "offices", force: :cascade do |t|
    t.integer  "commerce_id"
    t.string   "fantasy_name"
    t.integer  "office_type",          default: 0
    t.boolean  "is_sales",             default: false
    t.boolean  "is_technical_support", default: false
    t.string   "notes"
    t.string   "url"
    t.boolean  "enabled",              default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.datetime "deleted_at"
    t.integer  "city_id"
    t.string   "street"
    t.string   "number"
    t.string   "appartment"
    t.string   "floor"
    t.index ["city_id"], name: "index_offices_on_city_id", using: :btree
    t.index ["commerce_id"], name: "index_offices_on_commerce_id", using: :btree
    t.index ["deleted_at"], name: "index_offices_on_deleted_at", using: :btree
  end

  create_table "product_families", force: :cascade do |t|
    t.string   "name"
    t.boolean  "enabled"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.datetime "deleted_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["deleted_at"], name: "index_product_families_on_deleted_at", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.integer  "product_family_id"
    t.string   "name"
    t.string   "description"
    t.boolean  "enabled"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "deleted_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "documentation_file_name"
    t.string   "documentation_content_type"
    t.integer  "documentation_file_size"
    t.datetime "documentation_updated_at"
    t.string   "specification_file_name"
    t.string   "specification_content_type"
    t.integer  "specification_file_size"
    t.datetime "specification_updated_at"
    t.integer  "product_models_id"
    t.index ["deleted_at"], name: "index_products_on_deleted_at", using: :btree
    t.index ["product_family_id"], name: "index_products_on_product_family_id", using: :btree
    t.index ["product_models_id"], name: "index_products_on_product_models_id", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "country_alpha2"
    t.string   "ISO3166_2"
    t.string   "name"
    t.boolean  "enabled"
    t.datetime "deleted_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["deleted_at"], name: "index_states_on_deleted_at", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "role"
    t.string   "name"
    t.string   "company_name"
    t.string   "surname"
    t.datetime "deleted_at"
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.json     "tokens"
    t.index ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["provider"], name: "index_users_on_provider", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid"], name: "index_users_on_uid", using: :btree
  end

  add_foreign_key "cities", "states"
  add_foreign_key "models", "products"
  add_foreign_key "offices", "cities"
  add_foreign_key "offices", "commerces"
  add_foreign_key "products", "product_families"
end
