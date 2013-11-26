require 'spec_helper'

describe Room do
  let(:discount) do 
    Discount.new(room_id: suite.id,
                start_date: Date.new(2013, 11, 25),
                end_date: Date.new(2013, 11, 26),
                disc_rate: 0.5,
                los: 3)
  end

  let(:price) do
    Price.new(room_id: suite.id, 
             qty: 4, 
             price: 100, 
             start_date: Date.new(2013, 11, 20), 
             end_date: Date.new(2013, 12, 20))
  end

  let(:luxor) { Hotel.new(name: "Luxor", address: "Las Vegas") }

  let(:suite) { Room.new(hotel_id: luxor.id, max_people: 4, name: "Presidential suite") }

  it "calculates price correctly" do
    luxor.save
    suite.save
    discount.save
    price.save

    suite.calculate_price(Date.new(2013, 11, 23), Date.new(2013, 11, 28)).should == 400 
  end
end
