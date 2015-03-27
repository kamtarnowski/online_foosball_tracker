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

ActiveRecord::Schema.define(version: 20150327041712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "match_results", force: :cascade do |t|
    t.integer  "winner"
    t.integer  "loser"
    t.integer  "points"
    t.integer  "player_id"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "match_results", ["loser"], name: "index_match_results_on_loser", using: :btree
  add_index "match_results", ["match_id"], name: "index_match_results_on_match_id", using: :btree
  add_index "match_results", ["player_id"], name: "index_match_results_on_player_id", using: :btree
  add_index "match_results", ["points"], name: "index_match_results_on_points", using: :btree
  add_index "match_results", ["winner"], name: "index_match_results_on_winner", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "first_player"
    t.integer  "second_player"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "matches", ["first_player"], name: "index_matches_on_first_player", using: :btree
  add_index "matches", ["second_player"], name: "index_matches_on_second_player", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "name"
    t.decimal  "place"
    t.decimal  "chances"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "slug"
  end

  add_index "players", ["chances"], name: "index_players_on_chances", using: :btree
  add_index "players", ["name"], name: "index_players_on_name", using: :btree
  add_index "players", ["place"], name: "index_players_on_place", using: :btree
  add_index "players", ["slug"], name: "index_players_on_slug", unique: true, using: :btree

  add_foreign_key "match_results", "matches"
  add_foreign_key "match_results", "players"
end
