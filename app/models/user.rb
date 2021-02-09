class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
    validates :nickname,               presence: true       
    validates :encrypted_password,     presence: true, length: { minimum: 6 } 
    validates :family_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現
    validates :family_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
    validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現
    validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
    validates :birth_day,              presence: true
end