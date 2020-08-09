# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :nickname,            null: false
      t.string :email,              null: false, unique: true,default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :family_name,        null: false
      t.string :first_name,         null: false
      t.string :family_name_rubi,    null: false
      t.string :first_name_rubi,     null: false
      t.date   :birthday,           null: false
      # t.integer :birth_month,        null: false
      # t.integer :birth_day,          null: false
      t.text    :introduction
      t.string  :avatar
      # t.reference :user             null: false, foreign_key: true


      # t.string :destination_family_name, null: false
      # t.string :destination_first_name, null: false
      # t.string :destination_family_name_rubi, null: false
      # t.string :destination_first_name_rubi, null: false
      t.integer :zipcode, null:false
      t.integer :prefecture_code, null: false #default: 0
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.integer :phone_number, limit: 8,unique: true, null: true
      # t.integer :user_id, null: false, foreign_key: true


      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    # add_index :users, :name,                 unique: true
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
