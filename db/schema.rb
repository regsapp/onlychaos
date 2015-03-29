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

ActiveRecord::Schema.define(version: 20150327113148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.integer  "marks"
    t.boolean  "reference",        default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "test_id"
    t.integer  "question_part_id"
  end

  add_index "answers", ["question_part_id"], name: "index_answers_on_question_part_id", using: :btree
  add_index "answers", ["test_id"], name: "index_answers_on_test_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "year"
    t.boolean  "tutorial",   default: false
  end

  create_table "categories_tests", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "test_id",     null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "exam_boards", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "exam_boards", ["name"], name: "index_exam_boards_on_name", using: :btree

  create_table "exam_boards_questions", id: false, force: :cascade do |t|
    t.integer "exam_board_id", null: false
    t.integer "question_id",   null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_parts", force: :cascade do |t|
    t.text     "description"
    t.integer  "marks",       default: 1
    t.string   "answer_type"
    t.integer  "question_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "question_parts", ["question_id"], name: "index_question_parts_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "description"
    t.integer  "marks",         default: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "year_group_id"
    t.integer  "category_id"
    t.text     "hint"
  end

  add_index "questions", ["category_id"], name: "index_questions_on_category_id", using: :btree
  add_index "questions", ["year_group_id"], name: "index_questions_on_year_group_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "exam_board_id"
  end

  add_index "schools", ["exam_board_id"], name: "index_schools_on_exam_board_id", using: :btree
  add_index "schools", ["name"], name: "index_schools_on_name", using: :btree

  create_table "test_questions", force: :cascade do |t|
    t.integer  "test_id"
    t.integer  "question_id"
    t.integer  "number"
    t.integer  "marks"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "attempts",    default: 0
  end

  add_index "test_questions", ["question_id"], name: "index_test_questions_on_question_id", using: :btree
  add_index "test_questions", ["test_id"], name: "index_test_questions_on_test_id", using: :btree

  create_table "tests", force: :cascade do |t|
    t.integer  "year_group_id"
    t.integer  "duration"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "tutorial",      default: false
  end

  add_index "tests", ["user_id"], name: "index_tests_on_user_id", using: :btree
  add_index "tests", ["year_group_id"], name: "index_tests_on_year_group_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",                   default: "Student"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.integer  "school_id"
    t.boolean  "tutorial_completed",     default: false
    t.integer  "exam_board_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["exam_board_id"], name: "index_users_on_exam_board_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["school_id"], name: "index_users_on_school_id", using: :btree

  create_table "year_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "question_parts"
  add_foreign_key "answers", "tests"
  add_foreign_key "question_parts", "questions"
  add_foreign_key "questions", "categories"
  add_foreign_key "questions", "year_groups"
  add_foreign_key "schools", "exam_boards"
  add_foreign_key "test_questions", "questions"
  add_foreign_key "test_questions", "tests"
  add_foreign_key "tests", "users"
  add_foreign_key "tests", "year_groups"
  add_foreign_key "users", "exam_boards"
  add_foreign_key "users", "schools"
end
