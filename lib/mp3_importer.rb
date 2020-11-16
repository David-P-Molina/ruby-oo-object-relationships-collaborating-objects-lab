require "pry"
class MP3Importer
    attr_accessor :filename, :path
    def initialize(path)
        @path=path
    end
    def files
        #binding.pry
        files = []
        Dir.children(path)
        #Dir["/path/to/search/*"]
    end
    def import
      self.files.each {|file| Song.new_by_filename(file)}
    end
end