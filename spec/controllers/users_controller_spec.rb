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
end
