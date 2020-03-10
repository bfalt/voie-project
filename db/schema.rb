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

ActiveRecord::Schema.define(version: 2020_03_10_060458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agent_professions", force: :cascade do |t|
    t.bigint "agent_id"
    t.bigint "profession_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_agent_professions_on_agent_id"
    t.index ["profession_id"], name: "index_agent_professions_on_profession_id"
  end

  create_table "agents", force: :cascade do |t|
    t.string "company_name"
    t.string "company_address"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_agents_on_user_id"
  end

  create_table "job_listing_categories", force: :cascade do |t|
    t.bigint "job_listing_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_listing_id"], name: "index_job_listing_categories_on_job_listing_id"
    t.index ["service_id"], name: "index_job_listing_categories_on_service_id"
  end

  create_table "job_listings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "photo"
    t.string "address"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_job_listings_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "offer_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_messages_on_offer_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "status", default: "pending"
    t.integer "price"
    t.boolean "completed", default: false
    t.bigint "job_listing_id"
    t.bigint "agent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_offers_on_agent_id"
    t.index ["job_listing_id"], name: "index_offers_on_job_listing_id"
  end

  create_table "professions", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "star"
    t.text "comment"
    t.bigint "offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_reviews_on_offer_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "category"
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
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "photo"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "agent_professions", "agents"
  add_foreign_key "agent_professions", "professions"
  add_foreign_key "agents", "users"
  add_foreign_key "job_listing_categories", "job_listings"
  add_foreign_key "job_listing_categories", "services"
  add_foreign_key "job_listings", "users"
  add_foreign_key "messages", "offers"
  add_foreign_key "messages", "users"
  add_foreign_key "offers", "agents"
  add_foreign_key "offers", "job_listings"
  add_foreign_key "reviews", "offers"
end
