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

ActiveRecord::Schema.define(version: 20150313051443) do

  create_table "journals", force: :cascade do |t|
    t.string   "title"
    t.string   "status"
    t.date     "publication_date"
    t.integer  "number_of_issues"
    t.decimal  "institutional_price"
    t.decimal  "individual_price"
    t.decimal  "price_per_issue"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "number_of_subscriber"
  end

  create_table "journals_heads", force: :cascade do |t|
    t.string   "email_address"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.date     "username"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "journals_subscribers", id: false, force: :cascade do |t|
    t.integer "journal_id"
    t.integer "subscriber_id"
  end

  add_index "journals_subscribers", ["journal_id"], name: "index_journals_subscribers_on_journal_id"
  add_index "journals_subscribers", ["subscriber_id"], name: "index_journals_subscribers_on_subscriber_id"

  create_table "subscribers", force: :cascade do |t|
    t.string   "username"
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
    t.integer  "subscribed_journals"
    t.string   "ip_address"
    t.string   "subscription_status"
    t.string   "payment_status"
    t.string   "delivery_status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "journal_id"
    t.integer  "subscriber_id"
    t.date     "subscription_date"
    t.integer  "years_of_subscription"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.decimal  "price"
  end

end
