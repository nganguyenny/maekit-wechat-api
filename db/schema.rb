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

ActiveRecord::Schema.define(version: 2019_08_20_081945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_url"
    t.string "author"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "makerspace_id"
    t.string "title"
    t.string "location"
    t.date "date"
    t.time "time"
    t.text "description"
    t.string "event_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["makerspace_id"], name: "index_events_on_makerspace_id"
  end

  create_table "makerspace_photos", force: :cascade do |t|
    t.bigint "makerspace_id"
    t.string "image_url"
    t.string "image_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["makerspace_id"], name: "index_makerspace_photos_on_makerspace_id"
  end

  create_table "makerspaces", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "location"
    t.string "address"
    t.string "phone_number"
    t.string "email"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_url"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_steps", force: :cascade do |t|
    t.string "photo_url"
    t.text "description"
    t.bigint "project_id"
    t.string "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["project_id"], name: "index_project_steps_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "level"
    t.integer "preparation_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_url"
    t.string "title"
    t.text "materials"
    t.text "instructions"
    t.string "video_url"
    t.string "author"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "avatar_url"
    t.string "latitude"
    t.string "longtitude"
    t.integer "open_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "makerspaces"
  add_foreign_key "makerspace_photos", "makerspaces"
  add_foreign_key "project_steps", "projects"
end
