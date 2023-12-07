# spec/models/event_spec.rb

require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:organizer) }
  end

  describe 'associations' do
    it { should belong_to(:organizer).class_name('User').with_foreign_key('organizer_id') }
    it { should have_many(:event_users).class_name('EventUser').dependent(:destroy) }
    it { should have_many(:users).class_name('User').through(:event_users) }
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(FactoryBot.create(:event)).to be_valid
    end

    it 'creates an event with users' do
      event = FactoryBot.create(:event_with_users, users_count: 3)
      expect(event.users.count).to eq(3)
    end
  end
end
