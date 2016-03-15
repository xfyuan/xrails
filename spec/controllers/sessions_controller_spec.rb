require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create :user }

  describe 'POST #create' do
    context 'with valid params' do
      before do
        credential = { email: user.email, password: user.password }
        post :create, { user: credential }
      end

      it { should respond_with 200 }

      it 'returns the user with given credential' do
        user.reload
        expect(json_response[:authentication_token]).to eq user.authentication_token
      end
    end

    context 'with invalid params' do
      before do
        credential = { email: user.email, password: 'invalidpassword' }
        post :create, user: credential
      end

      it { should respond_with 401 }

      it 'returns the user with given credential' do
        expect(json_response).to have_key(:errors)
        expect(json_response[:errors]).to include 'Invalid email or password'
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      credential = { email: user.email, password: user.password }
      post :create, user: credential
      user.reload
      delete :destroy, id: user.authentication_token
    end

    it { should respond_with 204 }
  end
end
