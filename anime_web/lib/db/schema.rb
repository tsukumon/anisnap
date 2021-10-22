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

ActiveRecord::Schema.define(version: 2020_02_05_011622) do

  create_table "alerts", force: :cascade do |t|
    t.text "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "url"
  end

  create_table "anime_lists", force: :cascade do |t|
    t.text "title"
    t.text "title_kana"
    t.text "image"
    t.text "season"
    t.text "media"
    t.text "season_st"
    t.text "release"
    t.text "official_site_url"
    t.text "official_twi"
    t.text "episode_count"
    t.text "story"
    t.text "cv"
    t.text "company"
    t.text "broadcast"
    t.text "watch_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "pv1"
    t.text "pv1_image"
    t.text "pv2"
    t.text "staff"
    t.text "episode_stack"
    t.integer "year"
    t.text "topimg"
    t.string "copylight"
    t.string "weeklyimg"
    t.string "image1"
    t.string "image2"
    t.string "image3"
    t.string "items"
    t.text "pv2_image"
    t.text "cvflex"
    t.string "bgimage"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "subject"
  end

  create_table "episodelists", force: :cascade do |t|
    t.text "title"
    t.text "str_count"
    t.text "animetitle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "counter"
    t.string "anime_id"
  end

  create_table "impressions", force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "joblists", force: :cascade do |t|
    t.text "job"
    t.integer "userid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mitalists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "anime_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state"
  end

  create_table "newslists", force: :cascade do |t|
    t.text "article_title"
    t.text "content"
    t.text "relation"
    t.text "samune_img"
    t.text "content_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "bassui"
    t.integer "impressions_count", default: 0
  end

  create_table "postlikes", force: :cascade do |t|
    t.string "like"
    t.integer "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "ranking2019_autumn_points", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranking2019_spring_points", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranking2019_summer_points", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranking2019summers", force: :cascade do |t|
    t.string "anime_id"
    t.string "integer"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranking_total_charas", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "rank"
    t.string "score_up"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranking_total_draws", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "rank"
    t.string "score_up"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranking_total_musics", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "rank"
    t.string "score_up"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranking_total_mylists", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "rank"
    t.string "score_up"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranking_total_points", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "rank"
    t.string "score_up"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranking_total_reviews", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "rank"
    t.string "score_up"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranking_total_stories", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "rank"
    t.string "score_up"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranking_total_totals", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "rank"
    t.string "score_up"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranking_total_voices", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "rank"
    t.string "score_up"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranking_weeklies", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "rank_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rankings", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "mylist_count"
    t.integer "review_count"
    t.decimal "ave_score", precision: 2, scale: 1
    t.decimal "score_story", precision: 2, scale: 1
    t.decimal "score_write", precision: 2, scale: 1
    t.decimal "score_music", precision: 2, scale: 1
    t.decimal "score_voice", precision: 2, scale: 1
    t.decimal "score_char", precision: 2, scale: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_point"
    t.string "year"
    t.string "season"
    t.integer "rank_total"
    t.integer "rank_ave"
    t.integer "rank_mylist"
    t.integer "rank_review"
    t.integer "rank_music"
    t.integer "rank_story"
    t.integer "rank_write"
    t.integer "rank_voice"
    t.integer "rank_chara"
    t.integer "rank_total_season"
    t.integer "rank_ave_season"
    t.integer "rank_mylist_season"
    t.integer "rank_review_season"
    t.integer "rank_music_season"
    t.integer "rank_story_season"
    t.integer "rank_write_season"
    t.integer "rank_voice_season"
    t.integer "rank_chara_season"
    t.integer "rank_total_weekly"
    t.integer "rank_ave_weekly"
    t.integer "rank_mylist_weekly"
    t.integer "rank_review_weekly"
    t.integer "rank_music_weekly"
    t.integer "rank_story_weekly"
    t.integer "rank_write_weekly"
    t.integer "rank_voice_weekly"
    t.integer "rank_chara_weekly"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "animetitle"
    t.integer "user_id"
    t.text "kansou"
    t.string "state"
    t.decimal "total", precision: 3, scale: 1
    t.decimal "story", precision: 2, scale: 1
    t.decimal "draw", precision: 2, scale: 1
    t.decimal "music", precision: 2, scale: 1
    t.decimal "voice", precision: 2, scale: 1
    t.decimal "chara", precision: 2, scale: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "anime_id"
    t.integer "impressions_count", default: 0
    t.integer "good_count", default: 0
    t.string "bad_count"
  end

  create_table "seasons", force: :cascade do |t|
    t.text "this_term"
    t.text "next_term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "userlog_mylists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "anime_id"
    t.text "anime_title"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "review_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "userid"
    t.string "image"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "bgimage"
    t.text "intro"
    t.text "job"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
