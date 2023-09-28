# frozen_string_literal: true
class TeamsController < ApplicationController
  layout "container"
  before_action :connection_api

  def index
    response = @connection.get("get_teams_by_course_id", { course_id: params[:course_id].to_i })
    @course = Course.find(params[:course_id])
    @institution = @course.institution
    @teams = JSON.parse(response.body)
    render "body"
  end

  def new
    @team = Team.new
    course = Course.find(params[:relation_id])
    @team.course_id = course.id
    @action = "create"
    render "teams/form/form"
  end

  def edit
    @team = Team.find(params[:id])
    @action = "update"
    render "teams/form/form"
  end

  def create
    response = @connection.post("create", JSON.parse(params[:team].to_json))
    if response.success?
      render json: [title: "Success", content: "Team Created"]
    else
      error = JSON.parse(response.body)["error"].split("<br/>").first
      arr = error.split(":")
      title = arr.first
      errors = arr.second.split(", ")

      render json: {error: [title: title, errors: errors]}, status: :unprocessable_entity
    end
  end

  def update
    response = @connection.put("update", JSON.parse(params[:team].to_json))
    if response.success?
      render json: [title: "Success", content: "Team Updated"]
    else
      error = JSON.parse(response.body)["error"].split("<br/>").first
      arr = error.split(":")
      title = arr.first
      errors = arr.second.split(", ")

      render json: {error: [title: title, errors: errors]}, status: :unprocessable_entity
    end
  end

  def destroy
    response = @connection.delete("delete", { id: params[:id].to_i })
    render json: [title: "", content: ""]
  end

  private

  def connection_api
    base_url = "#{root_url}api/school/v1/teams"
    @connection = Faraday.new(url: base_url)
  end
end
