# frozen_string_literal: true
class TeamsController < ApplicationController
  layout "container"
  before_action :connection_api

  def index
    response = @connection.get("get_teams_by_course_id", { course_id: params[:course_id].to_i })
    @teams = JSON.parse(response.body)
    render "body"
  end

  private

  def connection_api
    base_url = "#{root_url}/api/school/v1/teams"
    @connection = Faraday.new(url: base_url)
  end
end
