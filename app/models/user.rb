class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Data Relationships
  has_many :categories, foreign_key: 'user_id', dependent: :destroy
  has_many :payments, foreign_key: 'user_id', dependent: :destroy

  # Data Validation
  validates :name, presence: true
end
