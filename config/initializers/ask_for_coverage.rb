# Unit test coverage must be explicitly required
# Launch test with $> UNIT_COVERAGE_PLEASE=true bin/rails test
unit_coverage = ENV['UNIT_COVERAGE_PLEASE'] == 'true' ? 'unit' : ''

# Functional coverage must be explicitly required
# Launch test with $> FUNCTIONAL_COVERAGE_PLEASE=true bin/rails cypress:run
functional_coverage = ENV['FUNCTIONAL_COVERAGE_PLEASE'] == 'true' ? 'functional' : ''


[unit_coverage, functional_coverage].each do |asked_coverage|
   
   if asked_coverage.present?
      require 'simplecov'
      SimpleCov.start 'rails' do
        coverage_dir "coverage/ruby/#{asked_coverage}".to_s
        add_filter "config"
        add_filter "test"
        add_filter "lib"
        add_filter "app/controllers/test_controller.rb"
      end
      puts "required simplecov for #{asked_coverage} testing"
   end

end
