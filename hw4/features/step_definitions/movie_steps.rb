Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(:title => movie[:title], :rating => movie[:rating], :director => movie[:director], :release_date => movie[:release_date])
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
  expect(page).to have_content(director)
end