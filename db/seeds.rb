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

test_user_1 = User.new(email: "takuma@gmail.com", password: "123456", first_name: "Takuma", last_name: "Naruke", role: "manager")
test_user_1.remote_photo_url = test_url
test_user_1.save

test_url = "https://kitt.lewagon.com/placeholder/users/kazeiu"
test_user_2= User.new(email: "caleb@gmail.com", password: "123456", first_name: "Caleb", last_name: "Finley", role: "teacher")
test_user_2.remote_photo_url = test_url
test_user_2.save

test_url = "https://kitt.lewagon.com/placeholder/users/non-b3"
test_user_3 = User.new(email: "nozomi@gmail.com", password: "123456", first_name: "Nozomi", last_name: "Ishii", role: "teacher")
test_user_3.remote_photo_url = test_url
test_user_3.save

test_url = "https://kitt.lewagon.com/placeholder/users/fumipi"
test_user_4 = User.new(email: "fumiko@gmail.com", password: "123456", first_name: "Fumiko", last_name: "Toyoda", role: "teacher")
test_user_4.remote_photo_url = test_url
test_user_4.save

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

levels.each do |l|
  course = Course.new(language:language, level: l, duration: 60, term: Term.first, user_id: User.first.id)
  course.save
end

students = [
  { name: "Ableen Tai",
    url: "https://kitt.lewagon.com/placeholder/users/ableen",
    },
  { name: "David Li",
    url: "https://kitt.lewagon.com/placeholder/users/DavidLi920",
   },
  { mame: "Henry Haller",
    url: "https://kitt.lewagon.com/placeholder/users/HenryHaller",
   },
  { name: "Hiroki Furuichi",
    url: "https://kitt.lewagon.com/placeholder/users/aivvinna",
   },
  { name: "Jan Paul Hoga",
    url: "https://kitt.lewagon.com/placeholder/users/jphoga",
  },
  { name: "Katrina Ariola",
    url: "https://kitt.lewagon.com/placeholder/users/naneng",
  },
  { name: "Larry Nevins",
    url: "https://kitt.lewagon.com/placeholder/users/ringochico",
  },
  { name: "Matthew Frazier",
    url: "https://kitt.lewagon.com/placeholder/users/mattfraz38",
  },
  { name: "Tania Perales",
    url: "https://kitt.lewagon.com/placeholder/users/taniadl",
  },
  { name: "Tsuzumi Sato",
    url: "https://kitt.lewagon.com/placeholder/users/sato623"
  },
  { name: "Sylvain Pierre",
    url: "https://kitt.lewagon.com/placeholder/users/SylvainPierre"
  },
  { name: "Paul Gaumer",
    url: "https://kitt.lewagon.com/placeholder/users/paulgaumer"
  },
  { name: "Douglas Berkley",
    url: "https://kitt.lewagon.com/placeholder/users/dmbf29"
  },
  { name: "Hidehiro Nagaoka",
    url: "https://kitt.lewagon.com/placeholder/users/hidehiro98"
  },
  { name: "Maria Altyeva",
    url: "https://kitt.lewagon.com/placeholder/users/maltyeva"
  },
    { name: "Reyes Montemayor",
    url: "https://kitt.lewagon.com/placeholder/users/reymon29"
  },
    { name: "Matheus Penchel",
    url: "https://kitt.lewagon.com/placeholder/users/mcpenchel"
  },
    { name: "Tomomi Shiba",
    url: "https://kitt.lewagon.com/placeholder/users/tomcana"
  },
  { name: "George Kettle",
    url: "https://kitt.lewagon.com/placeholder/users/georgekettle"
  },
  { name: "Georges Lorré",
    url: "https://kitt.lewagon.com/placeholder/users/GeorgesLorre"
  },
  { name: "George Delori",
    url: "https://kitt.lewagon.com/placeholder/users/Georgedelori"
  },
  { name: "George Cubas",
    url: "https://kitt.lewagon.com/placeholder/users/mateBarey"
  }
]

category = "student"

students.each do |s|
  url = s[:url]
  student_new = Student.new(name: s[:name], birth_date: Faker::Time.between(40.years.ago, 6.years.ago, period = :all), category: category)
  student_new.remote_photo_url = url
  student_new.save
end

80.times do
  url = "https://kitt.lewagon.com/placeholder/users/random"
  student_new = Student.new(name: Faker::Name.name, birth_date: Faker::Time.between(50.years.ago, 6.years.ago, period = :all), category: category)
  student_new.remote_photo_url = url
  student_new.save
end
puts "Created #{Student.count} students."

start_time = DateTime.new(2018,8,20,10)
courses = Course.all
teachers = User.all[1..3]
rooms = Room.all

21.times do
  10.times do
    teachers = teachers.shuffle
    i = 0
    rooms.sample(rand(1..3)).each do |r|
      Lesson.create(start_time: start_time, course_id: courses.sample.id, user_id: teachers[i].id, room_id: r.id)
      i = i + 1
    end
      start_time = start_time + 1.hour
  end
  start_time = start_time + 1.day - 10.hours
end

puts "Created #{Lesson.count} lessons in the 3 weeks from 20 August 2018"

lessons = Lesson.all
lessons.each do |l|
  students = Student.all.shuffle
  i = 0
  rand(3..5).times do
    Enrollment.create(lesson_id: l.id, student_id: students[i].id)
    i = i + 1
  end
end

puts "Created #{Enrollment.count} lessons."

comment = ["Pronunciation has improved drastically.", "Needs extra help with spelling.", "Has difficulty with past tense.",
"Learns new target structures quickly."]

100.times do
  Memo.create(comment: comment.sample, enrollment_id: Enrollment.all.sample.id)
end

puts "Created #{Memo.count} memos."

george_url = "https://kitt.lewagon.com/placeholder/users/Georgewwalden7"
student_new = Student.new(name: "George Walden", birth_date: DateTime.new(2001,11,11,11), category: "student")
student_new.remote_photo_url = george_url
student_new.save
