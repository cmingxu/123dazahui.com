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

ActiveRecord::Schema.define(version: 20141011030419) do

  create_table "news", force: true do |t|
    t.string   "title"
    t.string   "source"
    t.text     "description"
    t.string   "cate"
    t.string   "subcate"
    t.string   "md5"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stars", force: true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "country"
    t.date     "dob"
    t.string   "constellation"
    t.string   "career"
    t.string   "height"
    t.string   "rate"
    t.string   "blood"
    t.string   "home_town"
    t.string   "school"
    t.string   "company"
    t.string   "weight"
    t.string   "religon"
    t.string   "hobby"
    t.text     "desc"
    t.text     "desc_short"
    t.text     "achievement"
    t.text     "event"
    t.string   "source"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
