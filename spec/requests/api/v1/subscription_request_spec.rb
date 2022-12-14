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

    post "/api/v1/subscribe", params: params

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
  it 'cancels a tea subscription' do
    customer = create(:customer)
    tea = create(:tea)
    sub = create(:subscription, customer_id: customer.id, tea_id: tea.id)
    params = {
      sub_id: sub.id,
      status: "Canceled"
    }

    expect(sub[:status]).to eq("Active")

    patch "/api/v1/subscribe/cancel", params: params

    sub = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    expect(sub).to include :id, :type, :attributes
    expect(sub[:attributes]).to include :title, :price, :status, :frequency, :customer_id, :tea_id

    expect(sub[:attributes][:status]).to eq("Canceled")
  end

  it 'lists every current and past subscription' do
    customer = create(:customer)
    tea1 = create(:tea)
    tea2 = create(:tea)
    tea3 = create(:tea)
    create(:subscription, customer_id: customer.id, tea_id: tea1.id)
    create(:subscription, customer_id: customer.id, tea_id: tea2.id)
    create(:subscription, customer_id: customer.id, tea_id: tea3.id)

    get "/api/v1/customer/subscriptions", params: { customer_id: customer.id}

    subs = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    expect(subs.count).to eq(3)

    subs.each do |sub|
      expect(sub[:id]).to be_an(Integer)
      expect(sub[:title]).to be_a(String)
      expect(sub[:price]).to be_an(Integer)
      expect(sub[:status]).to be_a(String)
      expect(sub[:frequency]).to be_a(String)
      expect(sub[:customer_id]).to eq(customer.id)
    end
  end

  describe "sad path" do
    it "can't update status" do
      customer = create(:customer)
      tea = create(:tea)
      sub = create(:subscription, customer_id: customer.id, tea_id: tea.id)
      params = {
        sub_id: sub.id,
        status: nil
      }

      patch "/api/v1/subscribe/cancel", params: params

      expect(response).to_not be_successful
    end
  end
end
