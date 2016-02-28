require 'spec_helper'

describe MoviesController, :type => :controller do
  describe 'find movies with same director' do
    it 'should call the model method that finds movies with same director, if a director exists' do
      results = [double('movie1'), double('movie2')]
      movie = Movie.new(:director => 'George Lucas')
      movie.should_receive(:find_same_director).and_return(results)
      movie.find_same_director
    end
    it 'should make movies available to view'
    it 'should redirect to movies page if no director' do
      movie = Movie.new(:title => 'Nameless')
      get search_directors_path, :id => '1'
      response.should redirect_to movies_path
    end
  end
end