require 'rails_helper'

RSpec.describe "Regions", type: :request do
  let!(:region) { create(:region) }
  let!(:user) { create(:user) }
  let!(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:admin_user) { create(:user, role: 'admin') }
  let!(:admin_token) { JsonWebToken.encode(user_id: admin_user.id) }

  describe "GET /index" do
    it "renders a successful response" do
      get api_v1_regions_url, headers: {'Authorization': token}, as: :json
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get api_v1_region_url(region), headers: {'Authorization': token}, as: :json
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:valid_attributes) do
        {
          title: Faker::Name.name,
          country: 'USA',
          currency: 'UDS',
          tax: '0.01'
       }
      end

      it "creates a new region" do
        expect {
          post api_v1_regions_url,
               params: { region: valid_attributes }, headers: {'Authorization': admin_token}, as: :json
        }.to change(Region, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          title: "Test region title",
        }
      }

      it "updates the requested region" do
        patch api_v1_region_url(region),
              params: { region: new_attributes }, headers: {'Authorization': admin_token}, as: :json
        region.reload
        expect(region.title).to match("Test region title")
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested region" do
      expect {
        delete api_v1_region_url(region), headers: {'Authorization': admin_token}, as: :json
      }.to change(Region, :count).by(-1)
    end
  end
end
