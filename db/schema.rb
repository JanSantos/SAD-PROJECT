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

ActiveRecord::Schema.define(version: 20150319062406) do

  create_table "issues", force: :cascade do |t|
    t.integer  "journal_id"
    t.integer  "volume_number"
    t.integer  "issue_number"
    t.date     "date_published"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "journals", force: :cascade do |t|
    t.string   "title"
    t.string   "status"
    t.date     "publication_date"
    t.decimal  "institutional_price"
    t.decimal  "individual_price"
    t.decimal  "price_per_issue"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "number_of_subscriber",       default: 0
    t.integer  "number_of_issues",           default: 0
    t.decimal  "global_individual_price"
    t.decimal  "global_institutional_price"
    t.decimal  "local_institutional_price"
    t.decimal  "local_individual_price"
    t.decimal  "global_price_per_issue"
    t.decimal  "local_price_per_issue"
  end

  create_table "journals_subscribers", id: false, force: :cascade do |t|
    t.integer "journal_id"
    t.integer "subscriber_id"
  end

  add_index "journals_subscribers", ["journal_id"], name: "index_journals_subscribers_on_journal_id"
  add_index "journals_subscribers", ["subscriber_id"], name: "index_journals_subscribers_on_subscriber_id"

  create_table "subscribers", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.string   "subscription_type"
    t.string   "contact_person"
    t.integer  "phone_details"
    t.integer  "fax_details"
    t.string   "first_address"
    t.string   "second_address"
    t.string   "email_address"
    t.string   "zip_code"
    t.string   "ip_address"
    t.string   "subscription_status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "locality"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "journal_id"
    t.integer  "subscriber_id"
    t.date     "subscription_date"
    t.integer  "years_of_subscription"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.decimal  "price"
    t.string   "payment_status"
    t.string   "delivery_status"
    t.string   "subscription_status"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
