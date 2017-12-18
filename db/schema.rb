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

ActiveRecord::Schema.define(version: 20171218144829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dressing_item_pictures", force: :cascade do |t|
    t.integer  "dressing_item_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "photo"
    t.index ["dressing_item_id"], name: "index_dressing_item_pictures_on_dressing_item_id", using: :btree
  end

  create_table "dressing_items", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.float    "price"
    t.string   "gender"
    t.string   "color"
    t.string   "size"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "brand"
    t.string   "ref"
    t.boolean  "to_sell"
    t.boolean  "to_lend"
    t.boolean  "to_rent"
    t.index ["user_id"], name: "index_dressing_items_on_user_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.boolean  "is_accepted"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "loans", force: :cascade do |t|
    t.integer  "dressing_item_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["dressing_item_id"], name: "index_loans_on_dressing_item_id", using: :btree
    t.index ["user_id"], name: "index_loans_on_user_id", using: :btree
  end

  create_table "missing_item_pictures", force: :cascade do |t|
    t.string   "photo"
    t.integer  "missing_item_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["missing_item_id"], name: "index_missing_item_pictures_on_missing_item_id", using: :btree
  end

  create_table "missing_item_targets", force: :cascade do |t|
    t.integer  "missing_item_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["missing_item_id"], name: "index_missing_item_targets_on_missing_item_id", using: :btree
    t.index ["user_id"], name: "index_missing_item_targets_on_user_id", using: :btree
  end

  create_table "missing_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "ref"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "status"
    t.index ["user_id"], name: "index_missing_items_on_user_id", using: :btree
  end

  create_table "proposal_pictures", force: :cascade do |t|
    t.integer  "proposal_id"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["proposal_id"], name: "index_proposal_pictures_on_proposal_id", using: :btree
  end

  create_table "proposals", force: :cascade do |t|
    t.integer  "missing_item_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.string   "ref"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["missing_item_id"], name: "index_proposals_on_missing_item_id", using: :btree
    t.index ["user_id"], name: "index_proposals_on_user_id", using: :btree
  end

  create_table "shopping_cart_items", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "quantity"
    t.integer  "item_id"
    t.string   "item_type"
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_carts_on_user_id", using: :btree
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  add_foreign_key "dressing_item_pictures", "dressing_items"
  add_foreign_key "dressing_items", "users"
  add_foreign_key "loans", "dressing_items"
  add_foreign_key "loans", "users"
  add_foreign_key "missing_item_pictures", "missing_items"
  add_foreign_key "missing_item_targets", "missing_items"
  add_foreign_key "missing_item_targets", "users"
  add_foreign_key "missing_items", "users"
  add_foreign_key "proposal_pictures", "proposals"
  add_foreign_key "proposals", "missing_items"
  add_foreign_key "proposals", "users"
  add_foreign_key "shopping_carts", "users"
end
