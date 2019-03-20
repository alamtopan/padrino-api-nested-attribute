class User < ActiveRecord::Base
  validates_presence_of :name, :email
  validates_uniqueness_of :name
  
  has_one :profile
  accepts_nested_attributes_for :profile
  
  belongs_to :company
end
