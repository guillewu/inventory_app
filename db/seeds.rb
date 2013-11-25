luxor = Hotel.create(name: "Luxor", address: "Las Vegas")

luxor_pres = Room.create(hotel_id: luxor.id, max_people: 4, name: "Presidential suite")

Price.create(room_id: luxor_pres.id, 
             qty: 4, 
             price: 2000, 
             start_date: Date.new(2013, 11, 24), 
             end_date: Date.new(2013, 12, 20))

Price.create(room_id: luxor_pres.id, 
             qty: 4, 
             price: 3000, 
             start_date: Date.new(2013, 12, 21), 
             end_date: Date.new(2014, 1, 5))

# enfore Length of Stay of 3 days during high season
Discount.create(room_id: luxor_pres.id,
                start_date: Date.new(2013, 12, 23),
                end_date: Date.new(2014, 1, 2),
                disc_rate: 0,
                los: 3)

# provide 20% discount for low season
Discount.create(room_id: luxor_pres.id,
                start_date: Date.new(2013, 11, 24),
                end_date: Date.new(2013, 12, 10),
                disc_rate: 0.2,
                los: 1)
