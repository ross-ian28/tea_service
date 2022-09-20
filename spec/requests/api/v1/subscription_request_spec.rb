require 'rails_helper'

RSpec.describe 'The subscription API endpoints' do
  it 'creates a tea subscription' do
    customer = create(:customer)
    tea = create(:tea)
    params = {
      title: "Silver",
      price: 2.00,
      status: "Active",
      frequency: "Once a month",
      customer_id: customer.id,
      tea_id: tea.id
    }

    get "/api/v1/subscribe", params: params
  end
end
