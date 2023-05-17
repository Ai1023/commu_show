# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_05_10_050411) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.text "introduction", null: false
    t.string "nickname", null: false
    t.boolean "is_active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "event_calenders", force: :cascade do |t|
    t.string "event_title", null: false
    t.text "event_body", null: false
    t.datetime "start_time", null: false
    t.datetime "finish_time", null: false
    t.integer "member", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_event_calenders_on_customer_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_favorites_on_customer_id"
    t.index ["game_id"], name: "index_favorites_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.text "game_body", null: false
    t.string "game_title", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_games_on_customer_id"
  end

  create_table "join_events", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "event_calender_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_join_events_on_customer_id"
    t.index ["event_calender_id"], name: "index_join_events_on_event_calender_id"
  end

  create_table "post_comments", force: :cascade do |t|
    t.text "game_comment"
    t.integer "customer_id", null: false
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_post_comments_on_customer_id"
    t.index ["game_id"], name: "index_post_comments_on_game_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "event_calenders", "customers"
  add_foreign_key "favorites", "customers"
  add_foreign_key "favorites", "games"
  add_foreign_key "games", "customers"
  add_foreign_key "join_events", "customers"
  add_foreign_key "join_events", "event_calenders"
  add_foreign_key "post_comments", "customers"
  add_foreign_key "post_comments", "games"
end
