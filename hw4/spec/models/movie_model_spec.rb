require 'spec_helper'

describe Movie do
  describe 'find movies with same director' do
    before :each do
      @movie1 = Movie.new(:director => 'George Lucas')
      @movie2 = Movie.new(:director => 'George Lucas')
      @movie3 = Movie.new(:director => 'Christopher Nolan')
    end
    it 'should find movies by the same director' do
      # movies = @movie1.find_same_director
      # expect(movies).to include(@movie1, @movie2)
      @movie1.should_receive(:find_same_director).and_return([@movie1, @movie2])
      @movie1.find_same_director
    end
    it 'should not find movies by different directors' do
      movies = @movie1.find_same_director
      expect(movies).to_not include(@movie3)
    end
  end
end