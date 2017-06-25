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

ActiveRecord::Schema.define(version: 20160714133704) do

  create_table "answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "session_id"
    t.integer  "question_id"
    t.text     "options",         limit: 65535, null: false
    t.integer  "took",                          null: false
    t.boolean  "correct",                       null: false
    t.integer  "question_points"
    t.integer  "time_points"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.float    "numeric_option",  limit: 24
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["session_id"], name: "index_answers_on_session_id", using: :btree
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "screen_id"
    t.string   "title"
    t.string   "type",                                    null: false
    t.text     "right_options", limit: 65535
    t.text     "options",       limit: 65535
    t.integer  "points"
    t.integer  "position",                    default: 0, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.text     "hint",          limit: 65535
    t.text     "introduction",  limit: 65535
    t.index ["position"], name: "index_questions_on_position", using: :btree
    t.index ["screen_id"], name: "index_questions_on_screen_id", using: :btree
  end

  create_table "screens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "slug",                        null: false
    t.integer  "position",                    null: false
    t.string   "template",                    null: false
    t.integer  "questions_count", default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["position"], name: "index_screens_on_position", using: :btree
    t.index ["slug"], name: "index_screens_on_slug", using: :btree
    t.index ["template"], name: "index_screens_on_template", using: :btree
  end

  create_table "sessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "nickname"
    t.integer  "age"
    t.integer  "country"
    t.integer  "seconds",    default: 0,     null: false
    t.integer  "points",     default: 0,     null: false
    t.integer  "ranking",    default: 0,     null: false
    t.boolean  "completed",  default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["completed"], name: "index_sessions_on_completed", using: :btree
    t.index ["nickname"], name: "index_sessions_on_nickname", using: :btree
    t.index ["points"], name: "index_sessions_on_points", using: :btree
  end

end
