SimpleCov.start 'rails' do
   add_group "Models", "app/models"
   add_group "Controllers", "app/controllers"
end

SimpleCov.at_exit do
  SimpleCov.result.format!
  SimpleCov.minimum_coverage 60
  SimpleCov.minimum_coverage_by_file 60
end
