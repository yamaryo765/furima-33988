class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        with_options presence: true do
          validates :nickname,  :birth_day
        end
    validates :family_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現
    validates :family_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
    validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現
    validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
    validates :password,               presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
end
