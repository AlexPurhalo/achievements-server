# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# File uploading settings
require 'carrierwave/orm/activerecord'
