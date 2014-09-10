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

ActiveRecord::Schema.define(version: 20140910125316) do

  create_table "feedbacks", force: true do |t|
    t.string   "uid",               limit: 20
    t.string   "content",           limit: 2000
    t.string   "email"
    t.string   "order_number"
    t.string   "order_note"
    t.datetime "created_at"
    t.datetime "order_paid_at"
    t.datetime "error_reported_at"
  end

  add_index "feedbacks", ["uid"], name: "index_feedbacks_on_uid", using: :btree

  create_table "notices", force: true do |t|
    t.integer  "admin_user_id"
    t.text     "content"
    t.string   "title"
    t.datetime "published_at"
    t.datetime "closed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notices", ["admin_user_id"], name: "index_notices_on_admin_user_id", using: :btree

  create_table "uploads", force: true do |t|
    t.integer  "feedback_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "uploads", ["feedback_id"], name: "index_uploads_on_feedback_id", using: :btree

end
