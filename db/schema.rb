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

ActiveRecord::Schema.define(version: 2018_12_20_020429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "owners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "address"
    t.string "home_phone"
    t.string "cell_phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pet_owners", force: :cascade do |t|
    t.bigint "pet_id"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_pet_owners_on_owner_id"
    t.index ["pet_id"], name: "index_pet_owners_on_pet_id"
  end

  create_table "pet_vets", force: :cascade do |t|
    t.bigint "pet_id"
    t.bigint "vet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_pet_vets_on_pet_id"
    t.index ["vet_id"], name: "index_pet_vets_on_vet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.string "breed"
    t.string "color"
    t.datetime "dob"
    t.boolean "spayed_neutered"
    t.text "medications"
    t.text "feeding_instructions"
    t.text "shots"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "pet_id"
    t.bigint "owner_id"
    t.bigint "run_number"
    t.datetime "checkin"
    t.datetime "checkout"
    t.boolean "grooming"
    t.boolean "daycare"
    t.boolean "boarding"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_reservations_on_owner_id"
    t.index ["pet_id"], name: "index_reservations_on_pet_id"
  end

  create_table "runs", force: :cascade do |t|
    t.integer "run_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vets", force: :cascade do |t|
    t.string "practice_name"
    t.string "vet_name"
    t.text "address"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pet_owners", "owners"
  add_foreign_key "pet_owners", "pets"
  add_foreign_key "pet_vets", "pets"
  add_foreign_key "pet_vets", "vets"
  add_foreign_key "reservations", "owners"
  add_foreign_key "reservations", "pets"
end
