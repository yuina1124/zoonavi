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

ActiveRecord::Schema.define(version: 2022_07_13_122926) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "animals", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "introduction", default: "", null: false
    t.integer "animal_id"
    t.integer "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id", "tag_id"], name: "index_animals_on_animal_id_and_tag_id", unique: true
    t.index ["animal_id"], name: "index_animals_on_animal_id"
    t.index ["tag_id"], name: "index_animals_on_tag_id"
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tag_animals", force: :cascade do |t|
    t.integer "animal_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id", "tag_id"], name: "index_tag_animals_on_animal_id_and_tag_id", unique: true
    t.index ["animal_id"], name: "index_tag_animals_on_animal_id"
    t.index ["tag_id"], name: "index_tag_animals_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.integer "animal_id", null: false
    t.string "tag_name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_tags_on_animal_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.date "birthday", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zoo_animals", force: :cascade do |t|
    t.integer "animal_id", null: false
    t.integer "zoo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id", "zoo_id"], name: "index_zoo_animals_on_animal_id_and_zoo_id", unique: true
    t.index ["animal_id"], name: "index_zoo_animals_on_animal_id"
    t.index ["zoo_id"], name: "index_zoo_animals_on_zoo_id"
  end

  create_table "zoos", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "favorite", default: "", null: false
    t.integer "type"
    t.integer "many"
    t.integer "assessment", null: false
    t.string "address", default: "", null: false
    t.integer "users_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_zoos_on_users_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "animals", "animals"
  add_foreign_key "animals", "tags"
  add_foreign_key "tag_animals", "animals"
  add_foreign_key "tag_animals", "tags"
  add_foreign_key "tags", "animals"
  add_foreign_key "zoo_animals", "animals"
  add_foreign_key "zoo_animals", "zoos"
  add_foreign_key "zoos", "users", column: "users_id"
end
