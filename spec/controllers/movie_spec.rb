require 'spec_helper'

describe 'MoviesController' do
  describe 'searching for movies with same director' do
    it 'should call the model method that searches for movies with the same director' do
      Movie.should_receive(:movies_with_given_director).with('Alfred Hitchcock').
        and_return(:whatever)
        post :same_director, {:director => 'Alfred Hitchcock'}
    end
    it 'should make the search results available to the template'
  end
end