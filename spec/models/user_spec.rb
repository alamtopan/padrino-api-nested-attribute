require 'spec_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name)}
  it { is_expected.to belong_to(:company)}
  it { is_expected.to has_one(:profile)}
end
