require 'rails_helper'

RSpec.describe "Products", type: :request do
  let!(:region) { create(:region) }
  let!(:product) { create(:product, region_id: region.id) }
  let!(:user) { create(:user) }
  let!(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:admin_user) { create(:user, role: 'admin') }
  let!(:admin_token) { JsonWebToken.encode(user_id: admin_user.id) }

  describe "GET /index" do
    it "renders a successful response" do
      get api_v1_products_url, headers: {'Authorization': token}, as: :json
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get api_v1_product_url(product), headers: {'Authorization': token}, as: :json
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:valid_attributes) do
        {
          title: Faker::Name.unique.name,
          description: "Test description",
          price: 200.25,
          sku: Faker::Number.number,
          stock: 5,
          region_id: region.id
        }
      end

      it "creates a new Product" do
        expect {
          post api_v1_products_url,
               params: { product: valid_attributes }, headers: {'Authorization': admin_token}, as: :json
        }.to change(Product, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          title: "Test title",
        }
      }

      it "updates the requested product" do
        patch api_v1_product_url(product),
              params: { product: new_attributes }, headers: {'Authorization': admin_token}, as: :json
        product.reload
        expect(product.title).to match("Test title")
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested product" do
      expect {
        delete api_v1_product_url(product), headers: {'Authorization': admin_token}, as: :json
      }.to change(Product, :count).by(-1)
    end
  end
end
