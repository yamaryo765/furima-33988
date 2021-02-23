class User < ApplicationRecord
  has_many :items
  has_many :purchase_records
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
    with_options presence: true do
      validates :nickname
      validates :family_name,             format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/,message: "は全角文字で入力してください" } # ユーザー本名全角の正規表現
      validates :family_name_kana,        format: {with: /\A[ァ-ヶー－]+\z/,message: "は全角文字で入力してください"} # フリガナ全角の正規表現
      validates :first_name,              format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "は全角文字で入力してください" } # ユーザー本名全角の正規表現
      validates :first_name_kana,         format: {with: /\A[ァ-ヶー－]+\z/ ,message: "は全角文字で入力してください" } # フリガナ全角の正規表現
      validates :password,                format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i ,message: "は＠を含んだ半角英数字を使用してください"} 
      validates :birth_day 
    end
end 
