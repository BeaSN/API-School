require 'grape-swagger'

class Root < Grape::API
  format :json
  
  rescue_from :all do |e|
    exception = {
      error_code: 'System Error',
      error_desc: e,
      stacktrace: e.backtrace
    }
    error!(exception, 500)
  end

  mount School::V1::Base
end