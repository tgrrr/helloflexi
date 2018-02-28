require 'rails_helper'

describe User do
  describe 'validation callbacks' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:address_one) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:postal_code) }
    it { should validate_presence_of(:mobile) }
    it { should validate_presence_of(:preferred_location) }
    it { should validate_presence_of(:source) }
    it { should validate_presence_of(:agree_to_terms) }
    it { should validate_presence_of(:time_zone) }
    it { should have_many(:studios) }
    it { should have_many(:sign_ups) }
  end

  describe '.defaults' do
    let(:paid_user){ FactoryGirl.create(:paid_user) }
    let(:unpaid_user){ FactoryGirl.create(:user) }
    it 'sets leaves paid status of user in case of paid is true' do
      expect(paid_user.paid).to eq(true)
    end
    it 'sets user paid to false by default after initialize' do
      expect(unpaid_user.paid).to eq(false)
    end
    it 'sets monthly_class_visits for new user to 0 by default' do
      expect(unpaid_user.monthly_class_visits).to eq(0)
    end
  end

  describe '#user_accepted_terms' do
    let(:not_accepted_terms){ FactoryGirl.build(:with_not_accepted_terms) }
    it 'validates user when it has not accepted terms' do
      expect(not_accepted_terms).not_to be_valid
    end
  end
end