SimpleCov.start 'rails' do
   add_group "Models", "app/models"
   add_group "Controllers", "app/controllers"
end

SimpleCov.at_exit do
  SimpleCov.result.format!
  SimpleCov.minimum_coverage 85.95
#  SimpleCov.minimum_coverage_by_file 63
end

SimpleCov.start do
  add_filter "/images/"
  add_filter "/db/"
  add_filter "/helpers/"
end
