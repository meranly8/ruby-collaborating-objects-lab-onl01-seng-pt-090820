class Song
	attr_accessor :name, :artist
	@@all = []
	
	def initialize(name)
		@name = name
		@@all << self
	end

	def self.all
		@@all
	end

	def self.new_by_filename(filename)
	 	file_split = filename.split(" - ")
		name = file_split[0]
		artist = file_split[1]
		song = self.new(name)
		song.artist = artist_name(artist)
		song
	 
	 # artist, song_name = filename.split(" - ")
		# song = self.new(song_name)
		# song.artist_name = artist
		# song
	end

	def artist_name=(name)
		self.artist = Artist.find_or_create_by_name(name)
		artist.add_song(self)
	end
end