# frozen_string_literal: true
class CoursesController < ApplicationController
  layout "container"
  before_action :connection_api

  def index
    response = @connection.get("get_courses_by_institution_id", { institution_id: params[:institution_id].to_i })
    @institution = Institution.find(params[:institution_id])
    @courses = JSON.parse(response.body)
    render "body"
  end

  def new
    @course = Course.new
    institution = Institution.find(params[:relation_id])
    @team.institution_id = institution.id
    @action = "create"
    render "courses/form/form"
  end

  def edit
    @course = Course.find(params[:id])
    @action = "update"
    render "courses/form/form"
  end

  def create
    response = @connection.post("create", JSON.parse(params[:course].to_json))
    if response.success?
      render json: [title: "Success", content: "Course Created"]
    else
      error = JSON.parse(response.body)["error"].split("<br/>").first
      arr = error.split(":")
      title = arr.first
      errors = arr.second.split(", ")

      render json: {error: [title: title, errors: errors]}, status: :unprocessable_entity
    end
  end

  def update
    response = @connection.put("update", JSON.parse(params[:course].to_json))
    if response.success?
      render json: [title: "Success", content: "Course Updated"]
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
    base_url = "#{root_url}api/school/v1/courses"
    @connection = Faraday.new(url: base_url)
  end
end
