require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(
      name: 'Ulises',
      email: 'test@email.com',
      password: '654321'
    )

    @user.save
  end

  it 'Should have a name' do
    expect(@user.name).to eq('Ulises')
    @user.name = nil
    expect(@user).to_not be_valid
  end
end
