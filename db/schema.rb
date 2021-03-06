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

ActiveRecord::Schema.define(version: 20_180_927_050_718) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'adventures', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'str_date'
    t.datetime 'end_date'
    t.index ['user_id'], name: 'index_adventures_on_user_id'
  end

  create_table 'avatars', force: :cascade do |t|
    t.string 'picture'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.integer 'adventure_id'
    t.integer 'user_id'
    t.string 'title'
    t.datetime 'date'
    t.string 'picture'
    t.string 'caption'
    t.string 'video'
    t.text 'travel_log'
    t.string 'post_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['adventure_id'], name: 'index_posts_on_adventure_id'
    t.index %w[user_id adventure_id], name: 'index_posts_on_user_id_and_adventure_id'
  end

  create_table 'subscriptions', force: :cascade do |t|
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'taggings', id: :serial, force: :cascade do |t|
    t.integer 'tag_id'
    t.string 'taggable_type'
    t.integer 'taggable_id'
    t.string 'tagger_type'
    t.integer 'tagger_id'
    t.string 'context', limit: 128
    t.datetime 'created_at'
    t.index ['context'], name: 'index_taggings_on_context'
    t.index %w[tag_id taggable_id taggable_type context tagger_id tagger_type], name: 'taggings_idx', unique: true
    t.index ['tag_id'], name: 'index_taggings_on_tag_id'
    t.index %w[taggable_id taggable_type context], name: 'index_taggings_on_taggable_id_and_taggable_type_and_context'
    t.index %w[taggable_id taggable_type tagger_id context], name: 'taggings_idy'
    t.index ['taggable_id'], name: 'index_taggings_on_taggable_id'
    t.index ['taggable_type'], name: 'index_taggings_on_taggable_type'
    t.index %w[tagger_id tagger_type], name: 'index_taggings_on_tagger_id_and_tagger_type'
    t.index ['tagger_id'], name: 'index_taggings_on_tagger_id'
  end

  create_table 'tags', id: :serial, force: :cascade do |t|
    t.string 'name'
    t.integer 'taggings_count', default: 0
    t.index ['name'], name: 'index_tags_on_name', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'first_name'
    t.string 'last_name'
    t.string 'adventurer_type'
    t.datetime 'birthday'
    t.text 'quote'
    t.string 'username'
    t.text 'about'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'votes', force: :cascade do |t|
    t.integer 'adventure_id'
    t.integer 'post_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
