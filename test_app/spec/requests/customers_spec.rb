require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "index - status 200" do
      get customers_path
      expect(response).to have_http_status(:success)      
    end
    
    it "index - JSON" do
      get '/customers.json'      
      expect(response.body).to include_json([
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String),
      ])
    end    

    it "show - JSON" do
      get '/customers/1.json'      
      expect(response.body).to include_json(
        id: 1,
        name: (be_kind_of String),
        email: (be_kind_of String)
      )
    end
    
    it "create - JSON" do
      member = create(:member)
      login_as(member, scope: :member)

      headers = {"ACCEPT" => "application/json"}      
      customer_params = attributes_for(:customer)
      post "/customers.json", params: {customer: customer_params}, headers: headers

      expect(response.body).to include_json(
        id: /\d/,
        name: customer_params.fetch(:name),
        email: customer_params.fetch(:email)
      )
    end

    it "update - JSON" do
      member = create(:member)
      login_as(member, scope: :member)

      headers = {"ACCEPT" => "application/json"}      
      
      customer = Customer.first
      customer.name += ' - updated' 
      
      patch "/customers/#{customer.id}.json", params: {customer: customer.attributes}, headers: headers

      expect(response.body).to include_json(
        id: /\d/,
        name: customer.name,
        email: customer.email
      )
    end

    it "destroy - JSON" do
      member = create(:member)
      login_as(member, scope: :member)

      headers = {"ACCEPT" => "application/json"}      

      customer = Customer.first 

      expect{delete "/customers/#{customer.id}.json",  headers: headers}.to change(Customer, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end

  end
end
