require "pry"
class Song
    @@all= []
    attr_accessor :name, :artist
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def self.new_by_filename(filename) #takes in a file
        
        song = self.new(filename)#creates a new instance of a song
        song.name = filename.split(" - ")[1]
        song.artist_name= filename.split(" - ")[0]#connects new song instance with the artist from the filename
        song
    end
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
        # if #finds an Artist to assign song
        # else #creats a new artist instance and assigns it to the Song's attribute
        # end
    end
end