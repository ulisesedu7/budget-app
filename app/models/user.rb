class User < ApplicationRecord
  # Data Relationships

  # Data Validation
  validates :name, presence: true, length: { minimum: 2, maximum: 250 }
end
