require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest)}
    it { should have_secure_password }
  end

  describe 'instance methods' do
    context '#generate_api_key' do
      it 'generates an api key' do
        bob = User.create!(email: "bobbarker@faker.net", password: "123fake", password_confirmation:"123fake")
        bob.generate_api_key
        expect(bob.api_key).to be_a(String)
      end
    end
  end

end
