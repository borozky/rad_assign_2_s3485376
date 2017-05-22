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

ActiveRecord::Schema.define(version: 20170522011349) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_courses", id: false, force: :cascade do |t|
    t.integer "course_id",   null: false
    t.integer "category_id", null: false
    t.index ["course_id", "category_id"], name: "index_categories_courses_on_course_id_and_category_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "prerequisite"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "image"
    t.integer  "vote_resets",     default: 0
    t.datetime "last_vote_reset", default: '2017-05-22 02:10:32'
    t.integer  "users_id"
    t.index ["users_id"], name: "index_courses_on_users_id"
  end

  create_table "courses_locations", id: false, force: :cascade do |t|
    t.integer "course_id",   null: false
    t.integer "location_id", null: false
    t.index ["course_id", "location_id"], name: "index_courses_locations_on_course_id_and_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "role"
  end

  create_table "votes", force: :cascade do |t|
    t.boolean  "thumbs_up"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_votes_on_course_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

end
