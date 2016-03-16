require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build :user }

  describe 'validation' do
    it { should respond_to(:email) }
    it { should respond_to(:firstname) }
    it { should respond_to(:lastname) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:authentication_token) }

    it { should be_valid }

    it { should validate_presence_of(:email) }

    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:authentication_token) }

    it { should validate_confirmation_of(:password) }

    it { should validate_length_of(:email).is_at_least(6).is_at_most(50) }
    it { should validate_length_of(:password).is_at_least(4).is_at_most(30) }
    it { should validate_length_of(:firstname).is_at_least(2).is_at_most(30) }
    it { should validate_length_of(:lastname).is_at_least(2).is_at_most(30) }

    it { should allow_value('user@abc123.com').for(:email) }
    it { should_not allow_value('user@abc.', 'user@foo,com', 'user@foo+bar.com').for(:email) }

    it { should have_secure_password }
  end

  describe '#generate_authentication_token!' do
    let(:user) { create :user }

    before do
      allow(user).to receive(:authentication_token) { 'uniquetoken1234' }
    end

    it 'generate a unique token' do
      user.generate_authentication_token!
      expect(user.authentication_token).to eq 'uniquetoken1234'
    end

    it 'generate another token when one already has been taken' do
      existed_user = create :user, authentication_token: 'anothertoken1234'
      user.generate_authentication_token!
      expect(user.authentication_token).not_to eq existed_user.authentication_token
    end
  end
end
