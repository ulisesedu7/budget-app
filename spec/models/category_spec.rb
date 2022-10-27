require 'rails_helper'

RSpec.describe Category, type: :model do
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
    @payment.amount = 15
    @payment.categories.push(@category)

    @payment.save
    @category.payments.push(@payment)
    @category.save
  end

  it 'Should have a name' do
    expect(@category.name).to eq('Test')
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'Should have an icon' do
    expect(@category.icon).to eq('TestIcon')
    @category.icon = nil
    expect(@category).to_not be_valid
  end

  it 'Should return the total amount when the method is called' do
    expect(@category.total_amount).to eq(30) # Because it called the before each twice
  end
end
