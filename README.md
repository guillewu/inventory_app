Simple inventory management for hotels (only data and object model).

Things to look at: schema.rb, seeds.rb, erd.pdf, and app/models

To do:
- Unit test
- Simple interface to add hotels/prices/discounts
- DRY price.rb and discount.rb
- Refactor `Room#calculate_price`

After cloning the repo and running `rake db:seed`, you can launch `rails c` and play around with it:
```
1.9.3-p448 :012 > Room.last.calculate_price(Date.new(2013, 12, 24), Date.new(2013, 12, 28))
  Room Load (0.4ms)  SELECT "rooms".* FROM "rooms" ORDER BY "rooms"."id" DESC LIMIT 1
  Price Load (0.5ms)  SELECT "prices".* FROM "prices" WHERE "prices"."room_id" = 2 AND ((start_date <= '2013-12-28' AND end_date >= '2013-12-24'))
  Discount Load (0.1ms)  SELECT "discounts".* FROM "discounts" WHERE "discounts"."room_id" = 2 AND ((start_date <= '2013-12-28' AND end_date >= '2013-12-24'))
 => 15000.0
 
 1.9.3-p448 :014 > Room.last.calculate_price(Date.new(2013, 12, 11), Date.new(2013, 12, 12))
  Room Load (0.2ms)  SELECT "rooms".* FROM "rooms" ORDER BY "rooms"."id" DESC LIMIT 1
  Price Load (0.2ms)  SELECT "prices".* FROM "prices" WHERE "prices"."room_id" = 2 AND ((start_date <= '2013-12-12' AND end_date >= '2013-12-11'))
  Discount Load (0.1ms)  SELECT "discounts".* FROM "discounts" WHERE "discounts"."room_id" = 2 AND ((start_date <= '2013-12-12' AND end_date >= '2013-12-11'))
 => 4000.0 

1.9.3-p448 :013 > Room.last.calculate_price(Date.new(2013, 11, 24), Date.new(2013, 11, 26))
  Room Load (0.3ms)  SELECT "rooms".* FROM "rooms" ORDER BY "rooms"."id" DESC LIMIT 1
  Price Load (0.2ms)  SELECT "prices".* FROM "prices" WHERE "prices"."room_id" = 2 AND ((start_date <= '2013-11-26' AND end_date >= '2013-11-24'))
  Discount Load (0.1ms)  SELECT "discounts".* FROM "discounts" WHERE "discounts"."room_id" = 2 AND ((start_date <= '2013-11-26' AND end_date >= '2013-11-24'))
 => 4800.0 
```