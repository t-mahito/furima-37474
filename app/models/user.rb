class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,          presence: true
  validates :first_name_kanji,  presence: true
  validates :last_name_kanji,   presence: true
  validates :first_name_kana,   presence: true
  validates :last_name_kana,    presence: true
  validates :birthday,          presence: true

  with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "お名前には全角文字を使用してください" } do
    validates :first_name_kanji
    validates :last_name_kanji
  end

  with_options format: {with: /\A[ァ-ヶー]+\z/, message: "お名前[カナ]には全角カタカナを使用してください" } do
    validates :first_name_kana
    validates :last_name_kana
  end

  with_options format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Passwordには半角英数字混合で入力してください"} do
    validates :password
  end

end
