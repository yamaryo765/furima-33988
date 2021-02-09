class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        with_options presence: true do
          validates :nickname,:encrypted_password,:family_name, :family_name_kana, :first_name, :first_name_kana,  :birth_day
    validates :family_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現
    validates :family_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
    validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現
    validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
  end
end