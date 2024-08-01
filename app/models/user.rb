class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#全行でpresence trueをする
  with_options presence: true do
  validates :user_name
  validates :date_of_birth

  #この下だけひらがな、カタカナ、漢字の指定
  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
  validates :last_name
  validates :first_name
  end

  #この下だけカタカナだけの指定
  with_options format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ } do
  validates :last_name_kana
  validates :first_name_kana
  end
  end
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: {with: PASSWORD_REGEX}, confirmation: true

  has_many :items
  
end
