class Cult

    attr_reader :name, :location, :founding_year, :slogan

    @@all = []
    
    def initialize name, location, founding_year, slogan
        @name = name
        @location = location 
        @founding_year = founding_year
        @slogan = slogan

        @@all << self

    end

    def self.all 
        @@all
    end

    def self.find_by_name name 
        all.find{|cult| cult.name == name}
    end

    def self.find_by_location location
        all.find{|cult| cult.location == location}
    end

    def self.find_by_founding_year founding_year
        all.find{|cult| cult.founding_year == founding_year}
    end

    def recruit_follower follower
        BloodOath.new(self, follower, Time.now)
    end

    def my_followers
        my_oaths = BloodOath.all.filter{|bloodoath| bloodoath.cult == self}
        my_oaths.map{|oath| oath.follower}
    end

    def cult_population
        my_followers.count
    end

    def average_age
        ages = my_followers.map{|follower| follower.age}
        (ages.sum)/(ages.count)
    end

    def my_followers_mottos
        mottos = my_followers.map{|follower| follower.life_motto}
        mottos.each {|motto| puts motto}
    end

    def self.least_popular
        all.min{|cult| cult.cult_population}
    end

    def self.most_common_location
        all.max_by{|cult| cult.location}.location
    end 

end

