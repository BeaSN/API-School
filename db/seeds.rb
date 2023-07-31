should_institutions = true
should_courses = true
should_teams = true
should_students = true
should_quizzes = true

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
    ["#{course.name} A", "#{course.name} B", "#{course.name} C", "#{course.name} d"].each do |name|
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
  Course.all.each do |course|
    10.times do
      Quiz.create(name: Faker::Educator.course_name, description: Faker::Lorem.sentence, course_id: course.id)
    end
  end
end

