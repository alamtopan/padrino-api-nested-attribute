require 'spec_helper'

RSpec.describe Company, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string)}
  it { should validate_presence_of(:name)}
  it { should validate_uniqueness_of(:name)}
  it { is_expected.to have_many(:users)}
end
