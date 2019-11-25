require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'as a Guest' do 
    context '#index' do
      it 'responds successfully' do  
        get :index
        # Deprecated
        # expect(response).to be_success
        expect(response).to be_successful
      end
      
      it 'respond a 200 response' do  
        get :index
        expect(response).to have_http_status(200)
      end
    end

    it 'respond a 302 response (not authorized)' do 
      customer = create(:customer) 
      get :show, params: {id: customer.id}
      expect(response).to have_http_status(302)
    end  
  end

  describe 'as a Logged Member' do   
    it 'render a :show template' do
      member = create(:member)
      sign_in member
      customer = create(:customer) 
      get :show, params: {id: customer.id}
      expect(response).to render_template(:show)
    end
  end
end
