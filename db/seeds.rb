Memo.delete_all
Enrollment.delete_all
Student.delete_all
Lesson.delete_all
Course.delete_all
User.delete_all
Room.delete_all
Term.delete_all

puts "Deleted all the past data"

test_url = "https://kitt.lewagon.com/placeholder/users/takumamatata"
test_user= User.new(email: "test@gmail.com", password: "123456", first_name: "Takuma", last_name: "Naruke", role: "manager")
test_user.remote_photo_url = test_url
test_user.save

10.times do
  url = "https://kitt.lewagon.com/placeholder/users/random"
  user_new = User.new(email: Faker::Internet.email, password: "123456", first_name: Faker::HarryPotter.character.split[0], last_name: Faker::HarryPotter.character.split[1], role: "teacher")
  user_new.remote_photo_url = url
  user_new.save
end

puts "Created #{User.count} users"

Term.create(name: "1st semester", start_date: DateTime.new(2018,4,1,0), end_date: DateTime.new(2018,6,30,24))
Term.create(name: "2nd semester", start_date: DateTime.new(2018,7,1,0), end_date: DateTime.new(2018,9,30,24))
Term.create(name: "3rd semester", start_date: DateTime.new(2018,10,1,1), end_date: DateTime.new(2018,12,31,24))
Term.create(name: "4th semester", start_date: DateTime.new(2019,1,1,0), end_date: DateTime.new(2018,3,31,24))

puts "Created #{Term.count} semesters for a year from #{DateTime.new(2018,4,1,0)} to #{DateTime.new(2018,3,31,24)}"

Room.create(name: "101")
Room.create(name: "102")
Room.create(name: "103")

puts "Created #{Room.count} rooms from #{Room.first.name} to #{Room.last.name}"

language = "English"
levels = ["Novice", "Conversational", "Business", "Advanced"]
durations = [30, 45, 60, 90]
terms = Term.all

terms.each do |t|
  for num in 0..3 do
    Course.create(language:language, level: levels[num], duration: durations[num], term_id: t.id, user_id: User.first.id)
  end
end

category = "student"
description = "some description"

50.times do
  url = "https://kitt.lewagon.com/placeholder/users/random"
  student_new = Student.new(name: Faker::HarryPotter.character, birth_date: Faker::Time.between(50.years.ago, 6.years.ago, period = :all), category: category, description: description)
  student_new.remote_photo_url = url
  student_new.save
end
puts "Created #{Student.count} lessons."

user_id = User.first.id + 1
course_id = Course.first.id
room_id_1 = Room.first.id
Lesson.create(start_time: DateTime.new(2018,9,3,9), course_id: course_id, user_id: user_id, room_id: room_id_1)
user_id = user_id + 1
course_id = course_id + 1
room_id_2 = room_id_1 + 1
Lesson.create(start_time: DateTime.new(2018,9,3,9), course_id: course_id, user_id: user_id, room_id: room_id_2)
user_id = user_id + 1
course_id = course_id + 1
room_id_3 = room_id_2 + 1
Lesson.create(start_time: DateTime.new(2018,9,3,9), course_id: course_id, user_id: user_id, room_id: room_id_3)
user_id = user_id + 1
course_id = course_id + 1
Lesson.create(start_time: DateTime.new(2018,9,3,11), course_id: course_id, user_id: user_id, room_id: room_id_1)
user_id = user_id + 1
course_id = course_id + 1
Lesson.create(start_time: DateTime.new(2018,9,3,13), course_id: course_id, user_id: user_id, room_id: room_id_2)
user_id = user_id + 1
course_id = course_id + 1
Lesson.create(start_time: DateTime.new(2018,9,3,15), course_id: course_id, user_id: user_id, room_id: room_id_3)
user_id = user_id + 1
course_id = course_id + 1
Lesson.create(start_time: DateTime.new(2018,9,4,9), course_id: course_id, user_id: user_id, room_id: room_id_1)

puts "Created #{Lesson.count} lessons in the 1st week of September 2018"

lessons = Lesson.all
lessons.each do |l|
  Enrollment.create(lesson_id: l.id, student_id: Student.all.sample.id)
end

puts "Created #{Enrollment.count} lessons."

comment = ["some comment", "some more comment", "different comment"]

50.times do
  Memo.create(comment: comment.sample, enrollment_id: Enrollment.all.sample.id)
end

puts "Created #{Memo.count} memos."
