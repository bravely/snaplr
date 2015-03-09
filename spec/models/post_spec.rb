require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#title' do
    it { should have_db_column(:title).of_type(:string) }
  end

  describe '#body' do
    it { should validate_presence_of(:body) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:body).with_options(null: false) }
  end

  describe '#user' do
    it { should belong_to(:user) }
    it { should validate_presence_of(:user) }
    it { should have_db_index(:user_id) }
  end
end
