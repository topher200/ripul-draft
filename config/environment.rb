# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
RipulDraft::Application.initialize!

# Set environment
ENV['RAILS_ENV'] ||= 'production'
