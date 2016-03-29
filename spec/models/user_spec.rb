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
    it { should respond_to(:info) }

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

  describe 'accessor for info field which is jsonb column' do
    it '#info.blog accessor' do
      expect(user).to respond_to('blog')
      expect(user).to respond_to('blog=')
      expect{ user.blog }.not_to raise_error
    end

    it '#info.github accessor' do
      expect(user).to respond_to('github')
      expect(user).to respond_to('github=')
      expect{ user.github }.not_to raise_error
    end

    it '#info.twitter accessor' do
      expect(user).to respond_to('twitter')
      expect(user).to respond_to('twitter=')
      expect{ user.twitter }.not_to raise_error
    end
  end
end
