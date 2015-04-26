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

ActiveRecord::Schema.define(version: 20150426094320) do

  create_table "issues", force: :cascade do |t|
    t.integer  "journal_id",     limit: 4
    t.integer  "volume_number",  limit: 4
    t.integer  "issue_number",   limit: 4
    t.date     "date_published"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "journals", force: :cascade do |t|
    t.string   "title",                      limit: 255
    t.string   "status",                     limit: 255
    t.date     "publication_date"
    t.decimal  "institutional_price",                    precision: 10
    t.decimal  "individual_price",                       precision: 10
    t.decimal  "price_per_issue",                        precision: 10
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.integer  "number_of_subscriber",       limit: 4,                  default: 0
    t.integer  "number_of_issues",           limit: 4,                  default: 0
    t.decimal  "global_individual_price",                precision: 10
    t.decimal  "global_institutional_price",             precision: 10
    t.decimal  "local_institutional_price",              precision: 10
    t.decimal  "local_individual_price",                 precision: 10
    t.decimal  "global_price_per_issue",                 precision: 10
    t.decimal  "local_price_per_issue",                  precision: 10
  end

  create_table "journals_subscribers", id: false, force: :cascade do |t|
    t.integer "journal_id",    limit: 4
    t.integer "subscriber_id", limit: 4
  end

  add_index "journals_subscribers", ["journal_id"], name: "index_journals_subscribers_on_journal_id", using: :btree
  add_index "journals_subscribers", ["subscriber_id"], name: "index_journals_subscribers_on_subscriber_id", using: :btree

  create_table "subscribers", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "password",            limit: 255
    t.string   "subscription_type",   limit: 255
    t.string   "contact_person",      limit: 255
    t.integer  "phone_details",       limit: 4
    t.integer  "fax_details",         limit: 4
    t.string   "first_address",       limit: 255
    t.string   "second_address",      limit: 255
    t.string   "email_address",       limit: 255
    t.string   "zip_code",            limit: 255
    t.string   "ip_address",          limit: 255
    t.string   "subscription_status", limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "locality",            limit: 255
    t.datetime "deleted_at"
    t.string   "phone_number",        limit: 255
    t.string   "fax_number",          limit: 255
  end

  add_index "subscribers", ["deleted_at"], name: "index_subscribers_on_deleted_at", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "journal_id",            limit: 4
    t.integer  "subscriber_id",         limit: 4
    t.date     "subscription_date"
    t.integer  "years_of_subscription", limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.decimal  "price",                             precision: 10
    t.string   "payment_status",        limit: 255
    t.string   "delivery_status",       limit: 255
    t.string   "subscription_status",   limit: 255
    t.decimal  "amount_due",                        precision: 10
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
