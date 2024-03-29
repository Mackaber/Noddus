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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130926222540) do

  create_table "aplicacions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "vacante_id"
    t.boolean  "aceptado"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "aplicacions", ["user_id"], :name => "index_aplicacions_on_user_id"
  add_index "aplicacions", ["vacante_id"], :name => "index_aplicacions_on_vacante_id"

  create_table "emails", :force => true do |t|
    t.string   "mail"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mensajes", :force => true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.boolean  "seen"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "mensajes", ["user_id"], :name => "index_mensajes_on_user_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.string   "tipo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",     :default => "",           :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nombre"
    t.date     "cumpleanos"
    t.string   "escuela"
    t.string   "carrera"
    t.decimal  "ingles_prc"
    t.string   "idioma"
    t.decimal  "idioma_prc"
    t.string   "genero"
    t.string   "ubicacion"
    t.string   "telefono"
    t.string   "skype"
    t.string   "google_prof"
    t.string   "imagen"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "avance_car"
    t.string   "link_video"
    t.string   "perfil"
    t.text     "descripcion"
    t.string   "sitio_web"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "uid"
    t.string   "provider"
    t.string   "rol"
    t.string   "status",                 :default => "disponible"
    t.string   "avatar"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "pro",                    :default => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vacantes", :force => true do |t|
    t.text     "descripcion"
    t.string   "titulo"
    t.string   "area"
    t.string   "perfil"
    t.integer  "vistas"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "status",      :default => "disponible"
    t.date     "inicia"
    t.date     "termina"
    t.integer  "empresa_id"
    t.integer  "user_id"
    t.date     "vencimiento", :default => '2012-06-15'
    t.boolean  "plus",        :default => false
    t.float    "price",       :default => 179.0
    t.float    "price_plus",  :default => 229.0
  end

  add_index "vacantes", ["empresa_id"], :name => "index_vacantes_on_empresa_id"
  add_index "vacantes", ["user_id"], :name => "index_vacantes_on_user_id"

end
