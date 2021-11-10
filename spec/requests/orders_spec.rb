require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let!(:region) { create(:region) }
  let!(:product1) { create(:product, region_id: region.id) }
  let!(:product2) { create(:product, region_id: region.id) }
  let!(:user) { create(:user) }
  let!(:order) { create(:order, user_id: user.id) }
  let!(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:admin_user) { create(:user, role: 'admin') }
  let!(:admin_token) { JsonWebToken.encode(user_id: admin_user.id) }

  describe "GET /index" do
    it "renders a successful response" do
      get api_v1_orders_url, headers: {'Authorization': token}, as: :json
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get api_v1_order_url(order), headers: {'Authorization': token}, as: :json
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:valid_attributes) do
        {
          customer_name: Faker::Name.unique.name,
          shipping_address: "Test description",
          items: [{ "id": product1.id, "qty": 2 }, { "id": product2.id, "qty": 1 }].to_json,
        }
      end

      it "creates a new order" do
        expect {
          post api_v1_orders_url,
               params: { order: valid_attributes }, headers: {'Authorization': token}, as: :json
        }.to change(Order, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
