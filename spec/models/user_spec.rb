require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    subject(:user) { build :user }

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
    let(:user)        { create :user }
    let(:new_info)    { '{}'.as_json }
    let(:new_github)  { FFaker::Internet.http_url }
    let(:new_twitter) { FFaker::Internet.user_name }
    let(:new_blog)    { FFaker::Internet.http_url }

    describe '#info accessor' do
      it 'get info' do
        expect(user.info).to be_a(Hash)
        expect{ user.info }.not_to raise_error
      end

      it 'set info' do
        user.info = new_info
        user.save
        expect(user.info).to eq JSON.parse(new_info)
      end
    end

    describe '#github accessor' do
      it 'get info->attributes' do
        expect{ user.github }.not_to raise_error
      end

      it 'set info->attributes' do
        user.github = new_github
        user.save
        expect(user.github).to eq new_github
      end
    end

    describe '#twitter accessor' do
      it 'get info->attributes' do
        expect{ user.twitter }.not_to raise_error
      end

      it 'set info->attributes' do
        user.twitter = new_twitter
        user.save
        expect(user.twitter).to eq new_twitter
      end
    end
    describe '#blog accessor' do
      it 'get info->attributes' do
        expect{ user.blog }.not_to raise_error
      end

      it 'set info->attributes' do
        user.blog = new_blog
        user.save
        expect(user.blog).to eq new_blog
      end
    end
  end
end
