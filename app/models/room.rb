class Room < ActiveRecord::Base
  attr_accessible :hotel_id, :max_people, :name

  validates_presence_of :hotel_id, :max_people, :name
  validates_uniqueness_of :hotel_id, :scope => :name

  belongs_to :hotel
  has_many :prices
  has_many :discounts

  def calculate_price(search_start, search_end)
    total = 0
    day_price = 0
    room_prices = prices.where("(start_date <= ? AND end_date >= ?)", search_end, search_start)
    room_discounts = discounts.where("(start_date <= ? AND end_date >= ?)", search_end, search_start)

    (search_start..search_end).each do |d|
      room_prices.each do |room_price|
        if room_price.start_date <= d && room_price.end_date >= d
          day_price = room_price.price
        end
        room_discounts.each do |room_discount|
          if room_discount.start_date <= d && room_discount.end_date
            day_price -= room_discount.disc_rate * day_price
          end
        end
      end
      total += day_price
    end

    total
  end
end
