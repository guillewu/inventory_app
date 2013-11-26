require 'spec_helper'

describe Price do
  let(:price1) do
    Price.new(room_id: 1, 
             qty: 4, 
             price: 2000, 
             start_date: Date.new(2013, 11, 24), 
             end_date: Date.new(2013, 12, 20))
  end

  let(:price2) do
    Price.new(room_id: 1, 
             qty: 4, 
             price: 3000, 
             start_date: Date.new(2013, 12, 21), 
             end_date: Date.new(2014, 1, 5))
  end

  it "doesn't save when price already exists on that date" do
    price1.save
    price2.start_date = Date.new(2013, 12, 10)
    expect(price2).not_to be_valid
  end

  it "makes sure end date is larger than start date" do
    price1.end_date = Date.new(2013, 11, 20)
    expect(price1).not_to be_valid
  end

  it { should have_one(:hotel) }
  it { should belong_to(:room) }
end
