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

ActiveRecord::Schema.define(version: 20171007120219) do

  create_table "answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "question_id"
    t.string "ans_name"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "clazzs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "department_id"
    t.string "class_code", limit: 10
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_code"], name: "index_clazzs_on_class_code", unique: true
    t.index ["department_id"], name: "index_clazzs_on_department_id"
  end

  create_table "completeds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "student_id"
    t.bigint "test_id"
    t.boolean "true"
    t.datetime "last_touched"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_completeds_on_student_id"
    t.index ["test_id"], name: "index_completeds_on_test_id"
  end

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "dept_code", limit: 10
    t.string "dept_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dept_code"], name: "index_departments_on_dept_code", unique: true
  end

  create_table "eanswers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "equestion_id"
    t.string "ans_name"
    t.boolean "ticked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "correct"
    t.index ["equestion_id"], name: "index_eanswers_on_equestion_id"
  end

  create_table "equestions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "evaluation_id"
    t.text "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quest_id"
    t.integer "totalcorr"
    t.integer "totalgot"
    t.index ["evaluation_id"], name: "index_equestions_on_evaluation_id"
  end

  create_table "evaluations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "student_id"
    t.bigint "test_id"
    t.boolean "true"
    t.datetime "last_touched"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "score", limit: 24
    t.boolean "complete"
    t.integer "total"
    t.index ["student_id"], name: "index_evaluations_on_student_id"
    t.index ["test_id"], name: "index_evaluations_on_test_id"
  end

  create_table "gives_tests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "teacher_id"
    t.bigint "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_gives_tests_on_teacher_id"
    t.index ["test_id"], name: "index_gives_tests_on_test_id"
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "test_id"
    t.text "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "totalcorr"
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "question_id"
    t.bigint "evaluation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "answer_id"
    t.index ["answer_id"], name: "index_responses_on_answer_id"
    t.index ["evaluation_id"], name: "index_responses_on_evaluation_id"
    t.index ["question_id"], name: "index_responses_on_question_id"
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "matricule", limit: 10
    t.string "nom"
    t.string "prenoms"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "clazz_id"
    t.index ["clazz_id"], name: "index_students_on_clazz_id"
    t.index ["matricule"], name: "index_students_on_matricule", unique: true
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "clazz_id"
    t.string "sub_code", limit: 10
    t.string "sub_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clazz_id"], name: "index_subjects_on_clazz_id"
    t.index ["sub_code"], name: "index_subjects_on_sub_code", unique: true
  end

  create_table "teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nom"
    t.string "prenoms"
    t.string "password"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "subject_id"
    t.string "title"
    t.text "objective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.integer "evalnum"
    t.index ["subject_id"], name: "index_tests_on_subject_id"
    t.index ["teacher_id"], name: "index_tests_on_teacher_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "password"
  end

  add_foreign_key "students", "clazzs"
  add_foreign_key "tests", "teachers"
end
