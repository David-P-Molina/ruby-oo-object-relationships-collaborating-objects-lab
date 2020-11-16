require "pry"
class Artist
    attr_accessor :name, :songs
   @@all = []
    def initialize(name)
        @name = name
        @songs = []
        save
    end
    def self.all
        @@all
    end
    def songs
        Song.all.select{|song| song.artist == self}
    end
    def add_song(song)
        self.songs << song
        song.artist = self
    end
    def save
        @@all << self
    end

    def self.find_or_create_by_name(name)
      #  binding.pry
        if self.all.detect {|artist| artist.name == name}
         self.all.detect {|artist| artist.name == name}
        else 
            artist = Artist.new(name)
           # artist.save
            artist
        
         end
    end
    def print_songs
       self.songs.collect {|song| puts song.name}
    end
end