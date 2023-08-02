should_institutions = true
should_courses = true
should_teams = true
should_students = true
should_quizzes = true
should_colors = true

if should_institutions
  %w[PUC Mackenzie UFSC USP].each do |name|
    address = "#{Faker::Address.street_address.gsub(/\d/, '')}, #{rand(1..100)} - #{Faker::Address.city}, #{Faker::Address.state}, #{Faker::Address.country}, #{Faker::Address.zip_code}"
    Institution.create(name: name, phone: Faker::PhoneNumber.phone_number, address: address)
  end
end

if should_courses
  Institution.all.each do |institution|
    ['Administration', 'Civil Engineering', 'Medicine', 'Psychology', 'Computing'].each do |name|
      Course.create(name: name, description: Faker::Lorem.sentence, institution_id: institution.id)
    end
  end
end

if should_teams
  Course.all.each do |course|
    ["#{course.name} A", "#{course.name} B", "#{course.name} C", "#{course.name} D"].each do |name|
      Team.create(name: name, course_id: course.id)
    end
  end
end

if should_students
  Team.all.each do |team|
    5.times do
      Student.create(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}", email: Faker::Internet.unique.email, birthday: Faker::Date.birthday(min_age: 18, max_age: 65), team_id: team.id, password: '123456', password_confirmation: '123456')
    end
  end
end

if should_quizzes
  Team.all.each do |team|
    10.times do
      Quiz.create(name: Faker::Educator.course_name, description: Faker::Lorem.sentence, team_id: team.id)
    end
  end
end

if should_colors
  institution_1 = Institution.find(1)
  institution_1.color_1 = "#6322e7"
  institution_1.color_2 = "#814dea"
  institution_1.color_3 = "#9a75ec"
  institution_1.color_4 = "#b193ec"
  institution_1.save
  institution_2 = Institution.find(2)
  institution_2.color_1 = "#e35a11"
  institution_2.color_2 = "#f57938"
  institution_2.color_3 = "#f5905e"
  institution_2.color_4 = "#fcac83"
  institution_2.save
  institution_3 = Institution.find(3)
  institution_3.color_1 = "#06ab85"
  institution_3.color_2 = "#3cb99d"
  institution_3.color_3 = "#66bda8"
  institution_3.color_4 = "#8ec4b8"
  institution_3.save
  institution_4 = Institution.find(4)
  institution_4.color_1 = "#e11f3c"
  institution_4.color_2 = "#ee3651"
  institution_4.color_3 = "#ea677a"
  institution_4.color_4 = "#efa3af"
  institution_4.save
end


