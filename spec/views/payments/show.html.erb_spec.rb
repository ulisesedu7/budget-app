require 'rails_helper'

RSpec.describe "payments/show", type: :view do
  before(:each) do
    assign(:payment, Payment.create!(
      author_id: 2,
      name: "Name",
      amount: 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/3.5/)
  end
end
