# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)  # TODO:  What if error here?
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

# Buglet: this works for titles only!
Then /I should see "(.*)" before "(.*)"/ do |title1, title2|
  titles = page.all('#movies tbody tr').map {|row|  row.text.lines.to_a[0].chomp}
  i1, i2 = titles.index(title1), titles.index(title2)
  assert i1 && i2 && (i1 < i2)
end

# Assumption:  all movies displayed.  Else need different approach!
Then /the movies should be sorted alphabetically/ do
  movies = Movie.order(:title)
  (0...movies.size-1).each do |i|
    step %{I should see "#{movies[i].title}" before "#{movies[i+1].title}"}
  end
end

# Assumption:  all movies displayed.  Else need different approach!
Then /the movies should be sorted by release date/ do
  movies = Movie.order(:release_date)
  (0...movies.size-1).each do |i|
    step %{I should see "#{movies[i].title}" before "#{movies[i+1].title}"}
  end
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(/,\s*/).each do |rating|
    step %{I #{uncheck}check "ratings_#{rating}"}  # Figuring this out took forever!
    #step %{When I #{uncheck}check "ratings_#{rating}"}   # Seems inconsistent with ELLS fig. 5.10
  end
end

Then /I should only see movies with these ratings: (.*)/ do |rating_list|
  ratings = rating_list.split(/,\s*/)
  Movie.all.all? do |movie|
    if ratings.include? movie.rating
      step %{I should see "#{movie.title}"}
    else
      step %{I should not see "#{movie.title}"}
    end
  end
end

Then /I should see all of the movies/ do
  page.all('#movies tbody tr').size.should == Movie.all.size
end

Then /I should see none of the movies/ do
  page.all('#movies tbody tr').size.should == 0
end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
  # Should this be done via looking at web page, instead of in DB?
  Movie.find_by_title(title).director.should == director
end
