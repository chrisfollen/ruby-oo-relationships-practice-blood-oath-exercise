class Follower

    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize name, age, life_motto
        @name = name
        @age = age
        @life_motto = life_motto

        @@all << self

    end

    def self.all
        @@all
    end

    def self.of_a_certain_age age
        all.filter{|follower| follower.age >= age}
    end

    def cults
        my_cults = BloodOath.all.filter{|oath| oath.follower == self}
        my_cults.map{|oath| oath.cult}
    end

    def join_cult cult
        Bloodoath.new(cult, self, Time.now)
    end

    def my_cults
        my_oaths = BloodOath.all.filter{|bloodoath| bloodoath.follower == self}
        my_oaths.map{|oath| oath.cult}
    end

    def my_cults_slogans
        my_cults.each{|cult| puts cult.slogan}
    end

    def self.most_active
        all.max{|follower| follower.cults.count}
    end

    def self.top_ten
        sorted = all.sort_by{|follower| follower.cults.count}.take(10)
    end 

    def fellow_cult_members
        cults = self.my_cults 
        members = cults.map{|cult| cult.my_followers}
        unique_members = members.flatten.uniq
        unique_members.delete(self)
        unique_members
    end


end
