require 'spec_helper'

describe Discount do
  let(:discount1) do 
    Discount.new(room_id: 1,
                start_date: Date.new(2013, 12, 23),
                end_date: Date.new(2014, 1, 2),
                disc_rate: 0,
                los: 3)
  end

  let(:discount2) do 
    Discount.new(room_id: 1,
                start_date: Date.new(2013, 12, 28),
                end_date: Date.new(2014, 12, 30),
                disc_rate: 0,
                los: 3)
  end

  it "doesn't save when discount already exists on that date" do
    discount1.save
    expect(discount2).not_to be_valid
  end

  it "makes sure end date is larger than start date" do
    discount1.end_date = Date.new(2013, 12, 20)
    expect(discount1).not_to be_valid
  end

  it { should have_one(:hotel) }
  it { should belong_to(:room) }
end