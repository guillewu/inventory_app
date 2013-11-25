class Price < ActiveRecord::Base
  attr_accessible :room_id, :qty, :price, :start_date, :end_date
  validate :start_date_end_date, :date_overlap
  validates_presence_of :room_id, :qty, :price, :start_date, :end_date
  validates_start_date_end_date()

  belongs_to :room
  has_one :hotel, :through => :room, :source => :hotel

  def start_date_end_date
    if end_date < start_date
      errors.add(:start_date, "can't be larger than End date")
    end
  end

  def date_overlap
    rooms = Price.find_all_by_room_id(self.room_id)
    rooms.each do |room|
      if self.start_date <= room.end_date && room.start_date <= self.end_date
        errors.add(:start_date, "or End dats overlap")
      end
    end
  end
end
