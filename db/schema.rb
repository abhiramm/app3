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

ActiveRecord::Schema.define(version: 20130904070122) do

  create_table "clip_categories", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clip_category_performers", force: true do |t|
    t.integer  "clip_category_id"
    t.integer  "performer_id"
    t.decimal  "amount",           precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clip_category_performers", ["clip_category_id"], name: "index_clip_category_performers_on_clip_category_id"
  add_index "clip_category_performers", ["performer_id"], name: "index_clip_category_performers_on_performer_id"

  create_table "custom_videos", force: true do |t|
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delivery_time_performers", force: true do |t|
    t.integer  "delivery_time_id"
    t.integer  "performer_id"
    t.decimal  "amount",           precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delivery_time_performers", ["delivery_time_id"], name: "index_delivery_time_performers_on_delivery_time_id"
  add_index "delivery_time_performers", ["performer_id"], name: "index_delivery_time_performers_on_performer_id"

  create_table "delivery_times", force: true do |t|
    t.string   "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "duration_performers", force: true do |t|
    t.integer  "duration_id"
    t.integer  "performer_id"
    t.decimal  "amount",       precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "duration_performers", ["duration_id"], name: "index_duration_performers_on_duration_id"
  add_index "duration_performers", ["performer_id"], name: "index_duration_performers_on_performer_id"

  create_table "durations", force: true do |t|
    t.string   "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "durations", ["time"], name: "index_durations_on_time"

  create_table "item_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_category_performers", force: true do |t|
    t.integer  "item_category_id"
    t.integer  "performer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["name"], name: "index_locations_on_name", unique: true

  create_table "orders", force: true do |t|
    t.integer  "location_id"
    t.integer  "performer_id"
    t.integer  "duration_id"
    t.integer  "quality_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delivery_time_id"
    t.integer  "clip_category_id"
    t.integer  "total"
    t.integer  "custom_video_id"
    t.string   "email"
  end

  create_table "performers", force: true do |t|
    t.string   "first_name"
    t.integer  "white_label_id"
    t.integer  "location_id"
    t.string   "avatar"
    t.string   "location"
    t.string   "photo_id"
    t.string   "profile_thumb"
    t.string   "profile_gif"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "qualities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "qualities", ["name"], name: "index_qualities_on_name"

  create_table "quality_performers", force: true do |t|
    t.integer  "quality_id"
    t.integer  "performer_id"
    t.decimal  "amount",       precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quality_performers", ["performer_id"], name: "index_quality_performers_on_performer_id"
  add_index "quality_performers", ["quality_id"], name: "index_quality_performers_on_quality_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "performer_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "white_labels", force: true do |t|
    t.string   "name",                                null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  add_index "white_labels", ["email"], name: "index_white_labels_on_email", unique: true
  add_index "white_labels", ["location_id"], name: "index_white_labels_on_location_id"
  add_index "white_labels", ["reset_password_token"], name: "index_white_labels_on_reset_password_token", unique: true

end
