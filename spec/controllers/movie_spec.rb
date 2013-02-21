require 'spec_helper'

describe MoviesController do
  describe 'searching for movies with same director' do
    it 'should call the model method that searches for movies with the same director' do

      # More concise syntax than several "thebirds.stub(:id).and_return(17)"'s
      thebirds = mock('Movie', id: 17,
                                title: 'The Birds',
                                director: 'Alfred Hitchcock',
                                movies_with_same_director: [thebirds])

      Movie = mock("MovieClass")
      Movie.stub(:find).with('17').and_return(thebirds)

      thebirds.should_receive(:movies_with_same_director)
      get :search_by_director, {:id => 17}
    end
  end
  describe 'searching for movies with no director' do
    it 'should redirect to the home page' do
      
      flick = mock('Movie', id: 23,
                            title: 'The Texas Chainsaw Massacre XXXVII',
                            director: '')   # Checked: nil works as well

      # This yields a warning--'already initialized', or something.
      # Why?  Aren't the 'it' blocks independent?
      #Movie = mock("MovieClass")
      Movie.stub(:find).with('23').and_return(flick)

      get :search_by_director, {:id => 23}
      # ** THINK ABOUT **:  WHY 'SHOULD' AFTER IN THIS CASE, BUT BEFORE ABOVE?
      response.should redirect_to(:controller => 'movies', :action => 'index')
    end
  end
end
