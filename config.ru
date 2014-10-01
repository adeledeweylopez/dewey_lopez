# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'rack-block-semalt'
use Rack::BlockSemalt

run Rails.application
