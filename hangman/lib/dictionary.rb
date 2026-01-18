class Dictionary
  attr_reader :hangman_dictionary

  def initialize
    build_dictionary
  end

  def build_dictionary
    @hangman_dictionary = []
    File.open('./google-10000-english-no-swears.txt', 'r') do |file|
      for line in file.readlines
        @hangman_dictionary << line.chomp if line.chomp.length >= 5 && line.chomp.length <= 12
      end
      @hangman_dictionary.shuffle!
    end
  end
end
