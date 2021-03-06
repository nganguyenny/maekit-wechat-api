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

ActiveRecord::Schema.define(version: 2019_08_23_102543) do
  
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  
  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "makerspace_id"
    t.bigint "project_id"
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.integer "number_students"
    t.date "from_date"
    t.date "to_date"
    t.text "about_kids"
    t.text "other_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["makerspace_id"], name: "index_bookings_on_makerspace_id"
    t.index ["project_id"], name: "index_bookings_on_project_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end
  
  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_url"
    t.string "author"
    t.string "scan"
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
    t.string "longtitude"
    t.string "latitude"
  end
  
  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "project_name"
    t.bigint "project_id"
    t.index ["project_id"], name: "index_materials_on_project_id"
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
    t.string "preparation_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_url"
    t.string "title"
    t.string "video_url"
    t.string "author"
    t.string "tagline"
    t.string "category"
    t.string "category_text"
  end
  
  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "avatar_url"
    t.string "latitude"
    t.string "longtitude"
    t.string "open_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.string "phone_number"
  end
  
  add_foreign_key "bookings", "makerspaces"
  add_foreign_key "bookings", "projects"
  add_foreign_key "bookings", "users"
  add_foreign_key "events", "makerspaces"
  add_foreign_key "makerspace_photos", "makerspaces"
  add_foreign_key "materials", "projects"
  add_foreign_key "project_steps", "projects"
end
