class Category < ApplicationRecord
  # Data Relationships
  belongs_to :user
  has_and_belongs_to_many :payments

  # Data Validation
  validates :name, presence: true, length: { minimum: 0, maximum: 100 }
  validates :icon, presence: true

  # Total amount Method
  def total_amount
    total = 0
    payments.each do |payment|
      total += payment.amount
    end
    total
  end
end
