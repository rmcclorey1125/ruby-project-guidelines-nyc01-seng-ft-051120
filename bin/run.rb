require_relative '../config/environment'

christa = Student.create(name: "Christa", age: 22, gender: "Female", email: "crgammage@gmail.com", module: 1, course: "Software Engineering")
ronan = Student.create(name: "Ronan", age: 29, gender: "Male", email: "ronan@gmail.com", module: 2, course: "Data Science")
aleksandra = Student.create(name: "Aleksandra", age: 27, gender: "Female", email: "aleksandra@gmail.com", module: 3, course: "UI/UX Experience")

tashawn = Teacher.create(name: "Tashawn", age: 30, gender: "Male", emamil: "tashawn@flatironschool.com", module: 1, course: "Software Engineering", experience: 2)
yoan = Teacher.create(name: "Yoan", age: 32, gender: "Male", email: "yoan@flatironschool.com", module: 2, course: "Data Science", experience: 4)
sean = Teacher.create(name: "Sean", age: 31, gender: "Male", email: "sean@flatironschool.com", module: 3, course: "UI/UX Experience", experience: 10)


