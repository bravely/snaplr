require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#email' do
    it { should validate_presence_of(:email) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:email).with_options(null: false) }
  end
end
