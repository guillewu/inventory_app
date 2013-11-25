class Hotel < ActiveRecord::Base
  attr_accessible :name, :address
  validates_presence_of :name, :address
  validates_uniqueness_of :name

  has_many :rooms

  has_many :discounts, :through => :rooms , :source => :discounts

  has_many :prices, :through => :rooms, :source => :prices
end
