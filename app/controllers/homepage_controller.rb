class HomepageController < ApplicationController
  layout 'container'
  def index
    @total_institutions = Institution.count
    @total_courses = Course.count
    @total_teams = Team.count
    @total_students = Student.count
    @total_quizzes = Quiz.count
    @total_entities = @total_courses + @total_teams + @total_students + @total_quizzes + @total_institutions

    render "body"
  end
end