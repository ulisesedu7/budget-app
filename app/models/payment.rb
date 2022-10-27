class Payment < ApplicationRecord
  # Data Relationships
  belongs_to :user
  has_and_belongs_to_many :categories

  # Data Validation
  validates :name, presence: true, length: { minimum: 0, maximum: 100 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates_presence_of :categories
end
