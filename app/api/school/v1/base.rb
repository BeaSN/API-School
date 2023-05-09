class School::V1::Base < Grape::API
  format :json
  version "v1"
  prefix :school

  namespace :quizzes do
    mount School::V1::Quizzes
  end

  namespace :courses do
    mount School::V1::Courses
  end

  namespace :teams do
    mount School::V1::Teams
  end

  namespace :students do
    mount School::V1::Students
  end

  namespace :institutions do
    mount School::V1::Institutions
  end

  rescue_from :all do |e|
    unless (e.is_a? Grape::Exceptions::ValidationErrors) || (e.is_a? Grape::Exceptions::MethodNotAllowed) || (e.message.include?("Sqlite3::Error"))
      env = {}
      env["exception_notifier.exception_data"] = { :api => "API NEW ERROR", :message => e.message, :enviroment => Rails.env }
    end
    error_backtrace = "ERROR - API: #{e.message} <br/> \n BACKTRACE: #{e.backtrace.join "\n"}"
    Rails.logger.warn error_backtrace
    error!(error_backtrace)
  end

  add_swagger_documentation :info => {
                              title: "Web Service Documentation - API",
                              description: "[Bia API Training Platform] \n
      This Web Service API will help the comunication with iOS, Android and Web FrontEnd.
      Created in April 12, 2023.\n",
                            },
                            :hide_documentation_path => true
end
