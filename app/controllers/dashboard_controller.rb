class DashboardController < ApplicationController
  def index
    @total_institutions = Institution.count
    @total_courses = Course.count
    @total_teams = Team.count
    @total_students = Student.count
    @total_quizzes = Quiz.count
    @total_entities = @total_courses + @total_teams + @total_students + @total_quizzes + @total_institutions
    respond_to do |format|
      format.html {render "body", locals: { total_institutions: @total_institutions,
                                            total_courses: @total_courses,
                                            total_teams: @total_teams,
                                            total_students: @total_students,
                                            total_quizzes: @total_quizzes,
                                            total_entities: @total_entities } }
      format.js {render "body"}
    end
  end
end
