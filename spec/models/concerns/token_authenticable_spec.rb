require 'rails_helper'

RSpec.describe Authenticable, type: :model do
  let(:user) { create :user }
  let(:existed_user) { create :user }

  describe 'ensure generate a authentication token' do
    it 'generate a unique token' do
      expect(user.authentication_token).not_to eq(nil)
      expect(user.authentication_token).to be_a(String)
    end

    it 'generate another token when one already has been taken' do
      expect(user.authentication_token).not_to eq existed_user.authentication_token
    end

    it 'returns a user by the token' do
      expect(User.find_by_token(user.authentication_token)).to eq user
    end
  end
end
