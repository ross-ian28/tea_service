class Customer < ApplicationRecord
  has_many :subscription
  has_many :teas, through: :subscription

  validates_presence_of :first_name, :last_name, :email, :address
  validates_uniqueness_of :email, :address
end
