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

ActiveRecord::Schema.define(version: 20141220051433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "flashcards", force: true do |t|
    t.string   "question",            limit: nil,               null: false
    t.string   "answer",              limit: nil,               null: false
    t.decimal  "difficulty",                      default: 2.5
    t.integer  "user_id",                                       null: false
    t.integer  "deck_id"
    t.integer  "scheduled_review_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "repetitions",                     default: 0
    t.integer  "last_interval",                   default: 0
  end

  add_index "flashcards", ["deck_id"], name: "index_flashcards_on_deck_id", using: :btree
  add_index "flashcards", ["scheduled_review_id"], name: "index_flashcards_on_scheduled_review_id", using: :btree
  add_index "flashcards", ["user_id"], name: "index_flashcards_on_user_id", using: :btree

  create_table "reviews", force: true do |t|
    t.integer  "score"
    t.date     "review_date"
    t.integer  "flashcard_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "scheduled_reviews", force: true do |t|
    t.datetime "scheduled_date"
    t.integer  "user_id",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "scheduled_reviews", ["user_id"], name: "index_scheduled_reviews_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.text     "email"
    t.text     "password_digest"
    t.text     "first_name"
    t.text     "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
