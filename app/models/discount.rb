class Discount < ActiveRecord::Base
  include CustomValidation
  attr_accessible :room_id, :start_date, :end_date, :disc_rate, :los
  validate :start_date_end_date, :date_overlap
  validates_presence_of :room_id, :start_date, :end_date, :disc_rate, :los

  belongs_to :room
  has_one :hotel, :through => :room, :source => :hotel

  def start_date_end_date
    if end_date < start_date
      errors.add(:start_date, "can't be larger than End date")
    end
  end

  def date_overlap
    rooms = Discount.find_all_by_room_id(self.room_id)
    rooms.each do |room|
      next if room == self
      if self.start_date <= room.end_date && room.start_date <= self.end_date
        errors.add(:start_date, "or End dates overlap")
      end
    end
  end
end
