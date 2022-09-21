require 'rails_helper'

RSpec.describe 'The subscription API endpoints' do
  it 'creates a tea subscription' do
    customer = create(:customer)
    tea = create(:tea)
    params = {
      title: "Silver",
      price: 2.00,
      status: "Active",
      frequency: "Monthly",
      customer_id: customer.id,
      tea_id: tea.id
    }

    get "/api/v1/subscribe", params: params

    sub = JSON.parse(response.body, symbolize_names: true)[:data]
    new_sub = Subscription.last

    expect(response).to be_successful

    expect(sub).to include :id, :type, :attributes
    expect(sub[:id]).to eq(new_sub.id)
    expect(sub[:type]).to eq("subscription")

    expect(sub[:attributes]).to include :title, :price, :status, :frequency, :customer_id, :tea_id
    expect(sub[:attributes][:title]).to eq("Silver")
    expect(sub[:attributes][:price]).to eq(2.00)
    expect(sub[:attributes][:status]).to eq("Active")
    expect(sub[:attributes][:frequency]).to eq("Monthly")
    expect(sub[:attributes][:customer_id]).to eq(customer.id)
    expect(sub[:attributes][:tea_id]).to eq(tea.id)
  end
end
