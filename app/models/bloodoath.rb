class BloodOath

    attr_reader :cult, :follower, :initiation_date

    @@all = []

    def initialize cult, follower, initiation_date
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date

        @@all << self
    end

    def self.all
        @@all 
    end

    def self.first_oath
        sorted_oaths = all.sort_by{|oath| oath.initiation_date}
        sorted_oaths[0].follower
    end
end
