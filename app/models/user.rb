class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,  #:registerable, 新規登録機能削除
         :recoverable, :rememberable, :validatable
end
