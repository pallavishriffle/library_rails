# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_22_050510) do
  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.integer "publication_year"
    t.boolean "availability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "borrowers", force: :cascade do |t|
    t.string "name"
    t.string "contact_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "borrowings", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "borrower_id", null: false
    t.date "return_date"
    t.boolean "returned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_borrowings_on_book_id"
    t.index ["borrower_id"], name: "index_borrowings_on_borrower_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.string "notable_type", null: false
    t.integer "notable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable"
  end

  add_foreign_key "borrowings", "books"
  add_foreign_key "borrowings", "borrowers"
end
