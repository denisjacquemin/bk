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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110509104026) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "number"
    t.string   "box"
    t.string   "zipcode"
    t.string   "city"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bankaccounts", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bills", :force => true do |t|
    t.string   "name"
    t.string   "reference"
    t.date     "effective_date"
    t.integer  "status_id"
    t.integer  "amount_tvac"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
    t.integer  "company_id"
    t.text     "note"
    t.integer  "totaltvac_in_cents", :default => 0,     :null => false
    t.integer  "totalhtva_in_cents", :default => 0,     :null => false
    t.string   "location"
    t.integer  "status",             :default => 0
    t.text     "bill_footer"
    t.boolean  "deleted",            :default => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "slogan"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tva_number"
    t.string   "enreg_number"
    t.text     "bill_footer"
    t.string   "tel",          :default => ""
    t.string   "fax",          :default => ""
    t.string   "gsm",          :default => ""
    t.string   "email",        :default => ""
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "address_id"
    t.string   "email"
    t.text     "comment"
    t.integer  "title_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sex_id"
    t.string   "phone"
    t.string   "reference"
    t.integer  "company_id"
    t.string   "tva_number"
    t.boolean  "deleted",       :default => false
    t.integer  "customer_type", :default => 1
    t.string   "company_name"
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nationalities", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "quantity",           :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bill_id"
    t.integer  "tva_id"
    t.integer  "totaltvac_in_cents", :default => 0, :null => false
    t.integer  "totalhtva_in_cents", :default => 0, :null => false
    t.integer  "price_in_cents",     :default => 0, :null => false
  end

  create_table "sexes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.integer  "sort"
    t.integer  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tvas", :force => true do |t|
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort"
    t.integer  "active",     :default => 1
    t.integer  "company_id", :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "tutorial_step",                       :default => 0
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
