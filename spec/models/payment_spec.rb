require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:each) do
    @user = User.create(
      name: 'Ulises',
      email: 'test@email.com',
      password: '654321'
    )
    @category = Category.new
    @payment = Payment.new
    @category.user = @user
    @category.name = 'Test'
    @category.icon = 'TestIcon'

    @payment.user = @user
    @payment.name = 'Test'
    @payment.amount = 0
    @payment.categories.push(@category)

    @payment.save
    @category.payments.push(@payment)
    @category.save
  end

  it 'Should have a name' do
    @payment.name = nil
    expect(@payment).to_not be_valid
  end

  it 'Should allow only positive amounts' do
    @payment.amount = -5
    expect(@payment).to_not be_valid
    @payment.amount = 125
    expect(@payment).to be_valid
  end
end
