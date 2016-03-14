require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let!(:user) { create :user }
  let(:valid_attributes) { attributes_for :user }
  let(:invalid_attributes) { attributes_for :user, email: nil }

  describe 'GET #index' do
    before do
      get :index
    end

    it { should respond_with 200 }

    it 'assigns all user as @users' do
      expect(assigns(:users)).to eq [user]
    end
  end

  describe 'GET #show' do
    before do
      get :show, id: user.id
    end

    it { should respond_with 200 }

    it 'assigns the requested user as @user' do
      expect(assigns(:user)).to eq user
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      before do
        post :create, user: valid_attributes
      end

      it { should respond_with 201 }

      it 'create a new user' do
        expect {
          post :create, user: attributes_for(:user, email:'another@abc.com')
        }.to change(User, :count).by(1)
      end

      it 'assigns new created user as @user' do
        expect(assigns(:user)).to be_a(User)
      end

      it 'render the json response for user created' do
        expect(json_response).to be_a(Hash)
        expect(json_response[:email]).to eq valid_attributes[:email]
      end
    end

    context 'with invalid params' do
      before do
        post :create, user: invalid_attributes
      end

      it { should respond_with 422 }

      it 'renders an errors json' do
        expect(json_response).to have_key(:errors)
        expect(json_response[:errors][:email]).to include "can't be blank"
      end
    end
  end
end
