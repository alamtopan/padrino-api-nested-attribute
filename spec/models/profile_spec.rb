require 'spec_helper'

RSpec.describe Profile, type: :model do
  it { is_expected.to have_db_column(:address).of_type(:string) }
  it { is_expected.to belong_to(:user)}
end
