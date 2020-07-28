class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture 

    validates :name,             presence: true, uniqueness: true 
    validates :email,            presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password,         presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,40}+\z/i }
    validates :first_name,       presence: true, format: { with: /\A[一-龥ぁ-ん]/}
    validates :family_name,      presence: true, format: { with: /\A[一-龥ぁ-ん]/}
    validates :first_name_rubi,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :family_name_rubi, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :phone_number,     presence: true, format: { with: /\A\d{10,11}\z/ }
    validates :birth_year,       presence: true, format: { with: /\A\d{4}\z/}
    validates :birth_month,      presence: true
    validates :birth_day,        presence: true


    validates :prefecture_code,  presence: true


end