class Subscription < ApplicationRecord
  has_many :customers
  validates_presence_of :title, :price, :status, :frequency
end
