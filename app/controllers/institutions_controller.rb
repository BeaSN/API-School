# frozen_string_literal: true
class InstitutionsController < ApplicationController
  layout "container"
  before_action :connection_api

  def index
    response = @connection.get("get_institutions_by_team_id", { team_id: params[:team_id].to_i })
    @team = Team.find(params[:team_id])
    @institutions = JSON.parse(response.body)
    render "body"
  end

  def new
    @institution = Institution.new
    @action = "create"
    render "institutions/form/form"
  end

  def edit
    @institution = Institution.find(params[:id])
    @action = "update"
    render "institutions/form/form"
  end

  def create
    response = @connection.post("create", JSON.parse(params[:institution].to_json))
    if response.success?
      render json: [title: "Success", content: "Institution Created"]
    else
      error = JSON.parse(response.body)["error"].split("<br/>").first
      arr = error.split(":")
      title = arr.first
      errors = arr.second.split(", ")

      render json: {error: [title: title, errors: errors]}, status: :unprocessable_entity
    end
  end

  def update
    response = @connection.put("update", JSON.parse(params[:institution].to_json))
    if response.success?
      render json: [title: "Success", content: "Institution Updated"]
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
    base_url = "#{root_url}api/school/v1/institutions"
    @connection = Faraday.new(url: base_url)
  end
end
