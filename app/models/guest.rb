class Guest
    attr_accessor :name, :age, :hometown

    @@all = []

    def initialize(name, age, hometown)
        @name = name
        @age = age
        @hometown = hometown
        @@all << self
    end 

    #class methods
    def self.all
        @@all
    end 

    def self.pro_travellers
       self.all.filter { |guest| guest.trip_count > 1 }
    end 

    def self.find_all_by_name(name) #expects an argument of a string
        self.all.filter { |guest| guest.name == name }
    end 

    #instance methods

    def listings
        self.trips.collect{ |trip| trip.listing }
    end 

    def trips
        Trip.all.filter { |trip| trip.guest == self }
    end 

    def trip_count
        self.trips.count
    end 

end 