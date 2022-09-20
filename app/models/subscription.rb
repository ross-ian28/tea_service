class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customers
  
  validates_presence_of :title, :price, :status, :frequency
end
