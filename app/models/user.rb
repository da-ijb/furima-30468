class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do       
    validates :nickname
    validates :birth_date
 
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :last_name
    validates :first_name
    end

    with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
    validates :furigana_last_name
    validates :furigana_first_name
    end

    with_options format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } do
    validates :password
    end     
  end 

  has_many :items
end
