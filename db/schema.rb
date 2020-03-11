# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_311_141_732) do
  create_table 'comments', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.text 'content'
    t.bigint 'user_id', null: false
    t.bigint 'ticket_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['ticket_id'], name: 'index_comments_on_ticket_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'roles', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name', default: 'user'
    t.text 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'tickets', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.string 'status', default: 'open'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'assigned_to'
    t.index ['user_id'], name: 'index_tickets_on_user_id'
  end

  create_table 'users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'password_digest'
    t.bigint 'role_id', default: 3
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['role_id'], name: 'index_users_on_role_id'
  end

  add_foreign_key 'comments', 'tickets'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'tickets', 'users'
  add_foreign_key 'users', 'roles'
end
