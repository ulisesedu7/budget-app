class User < ApplicationRecord
  # Data Relationships
  has_many :categories, foreign_key: 'user_id', dependent: :destroy
  has_many :payments, foreign_key: 'user_id', dependent: :destroy

  # Data Validation
  validates :name, presence: true, length: { minimum: 0, maximum: 150 }
end
