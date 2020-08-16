class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save { self.email = email.downcase }
         
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture 

    validates :nickname,         presence: true
    validates :email,            presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password,         presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,30}+\z/i }
                                                                
    validates :first_name,       presence: true, format: { with: /\A[一-龥ぁ-ん]/}
    validates :family_name,      presence: true, format: { with: /\A[一-龥ぁ-ん]/}
    validates :first_name_rubi,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :family_name_rubi, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birthday,         presence: true 
   
    validates :zipcode,          presence: true,  format: { with: /\A\d{7}\z/ } #/^\d{7}$/
    validates :prefecture_code,  presence: true
    validates :city,             presence: true
    validates :house_number,     presence: true
    # validates :building_name    
    validates :phone_number,     allow_nil: true  , format: { with: /\A\d{10,11}\z/ } #/^\d{10,11}$/ 

  has_many :products
  has_one :credit_card, dependent: :destroy
  has_many :buyer_product, foreign_key: "buyer_id", class_name: "product", dependent: :destroy

end
