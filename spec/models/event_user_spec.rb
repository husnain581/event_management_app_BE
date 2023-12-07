require 'rails_helper'

RSpec.describe EventUser, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User').with_foreign_key('user_id').optional }
    it { should belong_to(:event).class_name('Event').with_foreign_key('event_id').optional }
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(FactoryBot.create(:event_user)).to be_valid
    end
  end
end
