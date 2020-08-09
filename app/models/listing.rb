class Listing
    attr_accessor :street_address, :city, :state

    @@all = []

    def initialize(street_address, city, state)
        @street_address = street_address
        @city = city
        @state = state 
        @@all << self
    end 

    #class methods
    
    def self.all
        @@all
    end 
    
    def self.find_all_by_city(city) #argument is a string
        self.all.filter { |listing| listing.city == city }
    end 

    def self.most_popular
        self.all.max { |listing_a, listing_b| listing_a.trip_count <=> listing_b.trip_count }
    end 

    #instance methods

    def guests
        self.trips.map { |trip| trip.guest }
    end 

    def trips
        Trip.all.filter { |trip| trip.listing == self }
    end 

    def trip_count
        self.trips.count 
    end 

end 