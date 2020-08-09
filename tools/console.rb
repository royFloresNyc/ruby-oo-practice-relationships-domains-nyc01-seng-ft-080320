require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


##Airbnb tests
guests = [
  {:name => "Alex Brown" , :age => 30, :hometown => "San Diego, CA"},
  {:name => "Savannah Smith", :age => 28, :hometown => "Raleigh, NC"},
  {:name => "Greg Santos", :age => 31, :hometown => "Dallas, TX"},
  {:name => "Adam Leung", :age => 25, :hometown => "New York, NY"},
  {:name => "Karen Vasquez", :age => 34, :hometown => "Orlando, FL"},
  {:name => "Alex Brown", :age => 21, :hometown => "Woodstock, VT"}
]

alex1, savannah, greg, adam, karen, alex2 = guests.map { |el| Guest.new(el[:name], el[:age], el[:hometown])}

listings = [
  {:street_address => "127 Riverside Dr.", :city => "New York", :state => "NY"},
  {:street_address => "456 Main St.", :city => "San Diego", :state => "CA"},
  {:street_address => "567 Yellow Stone Dr", :city => "Orlando", :state => "FL"},
  {:street_address => "546 Adirondack Rd", :city => "Buffalo", :state => "NY" },
  {:street_address => "9877 Ocean Dr", :city => "Miami", :state => "FL" },
]

new_york, san_diego, orlando, buffalo, miami = listings.map { |place| Listing.new(place[:street_address], place[:city], place[:state])}

20.times do 
   Trip.new(Listing.all.sample, Guest.all.sample)
end 

Pry.start