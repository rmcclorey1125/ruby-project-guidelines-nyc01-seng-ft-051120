require "tty-prompt"
class CommandLineInterface
def greet
    puts "Welcome to Flatiron school."
end

def who_am_i
    prompt = TTY::Prompt.new
    answer = prompt.select("Please select your position.") do |menu|
    menu.choice 'Student', 1
    menu.choice 'Teacher', 2
    menu.choice 'Recruiter', 3
    menu.choice 'Prospective Student', 4
    menu.choice 'Headmaster', 5
    menu.choice "Exit", 6
    end
    puts = answer
     if answer == 1
        puts "What is your name?"
        student_name = gets.chomp
        student(student_name)
    elsif
        answer == 2
        puts "What is your name?"
        teacher_name = gets.chomp
        teacher(teacher_name)
    elsif
        answer == 3
        recruiter
    elsif
        answer == 4
        prospective_student
    elsif
        answer == 5
        headmaster
    elsif
        answer == 6
        exit
    end
end
def exit
puts "Thank you! See you soon."
end

def student(student_name)
    prompt = TTY::Prompt.new
    answ = prompt.select("Hello #{student_name}, what would you like to do today?") do |menu|
        menu.choice 'I would like to see all of my teachers.', 1
        menu.choice 'I have passed my coding project and am upgrading a module.', 2
        menu.choice 'I would like to see all of the contact information for the students in my course.', 3
        menu.choice 'I would like to see all of the contact information for the students in my module.', 4
        menu.choice 'I would like to contact a teacher from course.', 5
        menu.choice 'I would like to change my email.', 6
        menu.choice 'Go back to main menu.', 7
        puts answ
        end
    if answ == 1
        std = Student.find_by(name: student_name)
        std.my_teachers
        student(student_name)
    elsif
        answ == 2
        std = Student.find_by(name: student_name)
        std.finish_coding_project
        student(student_name)
    elsif
        answ == 3
        std = Student.find_by(name: student_name)
        std.all_students_emails_from_my_course
        student(student_name)
    elsif
        answ == 4
        std = Student.find_by(name: student_name)
        std.all_students_emails_from_my_module
        student(student_name)
    elsif answ == 5
        choice = prompt.select("Which course?") do |menu|
            menu.choice "Software Engineering", 1
            menu.choice "Data Science", 2
            menu.choice "UI/UX Experience", 3
            menu.choice "Return", 4
        puts choice
        end
        if choice == 1
            Teacher.teachers_emails_by_course("Software Engineering")
            student(student_name)
        elsif choice == 2
            Teacher.teachers_emails_by_course("Data Science")
            student(student_name)
        elsif choice == 3
            Teacher.teachers_emails_by_course("UI/UX Experience")
            student(student_name)
        elsif choice == 4
            student(student_name)
        end
    elsif answ ==6
        puts "What is your new email?"
            new_email = gets.chomp
            std = Student.find_by(name: student_name)
            std.update_email(new_email)
            student(student_name)
    elsif answ == 7
        who_am_i
    end
end
def recruiter
    prompt = TTY::Prompt.new
    answer = prompt.select("Welcome to Flatiron School. What would you like to do today?") do |menu|
        menu.choice 'I would like to see all students seeking employment.', 1
        menu.choice 'I would like to see students seeking employment from a specific course course', 2
        menu.choice 'I would like to see all of the contact information for the teacher\'s of students seeking employment.', 3
        menu.choice 'Go back to main menu.', 4
        puts answer
    end
    if answer == 1
        Student.job_seeking
        recruiter
    elsif
        answer == 2
        choice = prompt.select("Which course you're looking for?") do |menu|
            menu.choice "Software Engineering", 1
            menu.choice "Data Science", 2
            menu.choice "UI/UX Experience", 3
            menu.choice "Return", 4
        puts choice
        end
        if choice == 1
            Student.job_seeking_by_course("Software Engineering")
            recruiter
        elsif choice == 2
            Student.job_seeking_by_course("Data Science")
            recruiter
        elsif choice == 3
            Student.job_seeking_by_course("UI/UX Experience")
            recruiter
        elsif choice == 4
            recruiter
        end
    elsif
        answer == 3
        Teacher.all_teachers_from_5_module
        recruiter
    elsif
        answer == 4
        who_am_i
    end
end

def teacher(teacher_name)
    prompt = TTY::Prompt.new
    answer = prompt.select("Hello #{teacher_name}, what would you like to do today?") do |menu|
        menu.choice 'I would like to see all of my students.', 1
        menu.choice 'I would like to search for a specific teacher\'s information.', 2
        menu.choice 'I would like to see a list of all of the teachers at Flatiron School.', 3
        menu.choice 'I would like to see all of the contact information for the teachers in my course.', 4
        menu.choice 'I would like to search for teacher\'s contact information by course.', 5
        menu.choice 'I would like to see how many students are in a specific module for a specific course.', 6
        menu.choice 'I would like to search for teachers by module.', 7
        menu.choice 'I would like to change my email.', 8
        menu.choice 'Go back to main menu.', 9
        puts answer
        end
        if answer == 1
            t = Teacher.find_by(name: teacher_name)
            t.my_students
            teacher(teacher_name)
        elsif answer == 2
            puts "What is the name of the teacher you are searching for?"
            specific_teacher = gets.chomp
            Teacher.search_teacher(specific_teacher)
            teacher(teacher_name)
        elsif answer == 3
            Teacher.all_teachers
            teacher(teacher_name)
        elsif answer == 4
            t = Teacher.find_by(name: teacher_name)
            t.teachers_emails_in_my_course
            teacher(teacher_name)
        elsif answer == 5
            choice = prompt.select("Which course?") do |menu|
                menu.choice "Software Engineering", 1
                menu.choice "Data Science", 2
                menu.choice "UI/UX Experience", 3
                menu.choice "Return", 4
            puts choice
            end
                if choice == 1
                 Teacher.teachers_emails_by_course("Software Engineering")
                 teacher(teacher_name)
                elsif choice == 2
                 Teacher.teachers_emails_by_course("Data Science")
                 teacher(teacher_name)
                elsif choice == 3
                 Teacher.teachers_emails_by_course("UI/UX Experience")
                 teacher(teacher_name)
                elsif choice == 4
                    teacher(teacher_name)
                end
        elsif answer == 6
            choice = prompt.select("Which course?") do |menu|
                menu.choice "Software Engineering", 1
                menu.choice "Data Science", 2
                menu.choice "UI/UX Experience", 3
                menu.choice "Return", 4
            puts choice
            end
            if choice == 1
                choice = prompt.select("Which module?") do |menu|
                    menu.choice "Module 1 - Software Engineering", 1
                    menu.choice "Module 2 - Sofware Engineering", 2
                    menu.choice "Module 3 - Software Engineering", 3
                    menu.choice "Module 4 - Software Engineering", 4
                    menu.choice "Module 5 - Software Engineering", 5
                    menu.choice "Return", 6
                puts choice
                end
                if choice == 1
                    Student.num_of_students(1, "Software Engineering")
                    teacher(teacher_name)
                elsif choice == 2
                    Student.num_of_students(2, "Software Engineering")
                    teacher(teacher_name)
                elsif choice == 3
                    Student.num_of_students(3, "Software Engineering")
                    teacher(teacher_name)
                elsif choice == 4
                    Student.num_of_students(4, "Software Engineering")
                    teacher(teacher_name)
                elsif choice == 5
                    Student.num_of_students(5, "Software Engineering")
                elsif choice == 6
                    teacher(teacher_name)
                end
            elsif choice == 2
                choice = prompt.select("Which module?") do |menu|
                    menu.choice "Module 1 - Data Science", 1
                    menu.choice "Module 2 - Data Science", 2
                    menu.choice "Module 3 - Data Science", 3
                    menu.choice "Module 4 - Data Science", 4
                    menu.choice "Module 5 - Data Science", 5
                    menu.choice "Return", 6
                puts choice
                end
                if choice == 1
                    Student.num_of_students(1, "Data Science")
                    teacher(teacher_name)
                elsif choice == 2
                    Student.num_of_students(2, "Data Science")
                    teacher(teacher_name)
                elsif choice == 3
                    Student.num_of_students(3, "Data Science")
                    teacher(teacher_name)
                elsif choice == 4
                    Student.num_of_students(4, "Data Science")
                    teacher(teacher_name)
                elsif choice == 5
                    Student.num_of_students(5, "Data Science")
                elsif choice == 6
                    teacher(teacher_name)
                end
            elsif choice == 3
                choice = prompt.select("Which module?") do |menu|
                    menu.choice "Module 1 - UI/UX Experience", 1
                    menu.choice "Module 2 - UI/UX Experience", 2
                    menu.choice "Module 3 - UI/UX Experience", 3
                    menu.choice "Module 4 - UI/UX Experience", 4
                    menu.choice "Module 5 - UI/UX Experience", 5
                    menu.choice "Return", 6
                puts choice
                end
                if choice == 1
                    Student.num_of_students(1, "UI/UX Experience")
                    teacher(teacher_name)
                elsif choice == 2
                    Student.num_of_students(2, "UI/UX Experience")
                    teacher(teacher_name)
                elsif choice == 3
                    Student.num_of_students(3, "UI/UX Experience")
                    teacher(teacher_name)
                elsif choice == 4
                    Student.num_of_students(4, "UI/UX Experience")
                    teacher(teacher_name)
                elsif choice == 5
                    Student.num_of_students(5, "UI/UX Experience")
                elsif choice == 6
                    teacher(teacher_name)
                end
            elsif choice == 4
                teacher(teacher_name)
            end
        elsif answer == 7
            choice = prompt.select("Which Module?") do |menu|
                menu.choice "Module 1", 1
                menu.choice "Module 2", 2
                menu.choice "Module 3", 3
                menu.choice "Module 4", 4
                menu.choice "Module 5", 5
                menu.choice "Return", 6
            puts choice
            end
            if choice == 1
                Teacher.search_teachers_by_module(1)
                teacher(teacher_name)
            elsif choice == 2
                Teacher.search_teachers_by_module(2)
                teacher(teacher_name)
            elsif choice == 3
                Teacher.search_teachers_by_module(3)
                teacher(teacher_name)
            elsif choice == 4
                Teacher.search_teachers_by_module(4)
                teacher(teacher_name)
            elsif choice == 5
                Teacher.search_teachers_by_module(5)
                teacher(teacher_name)
            elsif choice == 6
                teacher(teacher_name)
            end
        elsif answer == 8
            puts "What is your new email?"
            new_email = gets.chomp
            teach = Teacher.find_by(name: teacher_name)
            teach.update_email(new_email)
            teacher(teacher_name)
        elsif answer == 9
            who_am_i
        end
end

def prospective_student
    prompt = TTY::Prompt.new
    answer = prompt.select("Hello, what would you like learn about today?") do |menu|
        menu.choice 'Who are all the teachers at Flatiron School and thier contact information?', 1
        menu.choice 'How long has each teacher been teaching?', 2
        menu.choice 'How many students are in a course and module?', 3
        menu.choice 'Go back to main menu.', 4
    end
    puts = answer
    if answer == 1
        Teacher.all_teachers_and_email
        prospective_student
    elsif
        answer == 2
        Teacher.all_teachers_and_experience
        prospective_student
    elsif
        answer == 3
        choice = prompt.select("Which course?") do |menu|
            menu.choice "Software Engineering", 1
            menu.choice "Data Science", 2
            menu.choice "UI/UX Experience", 3
            menu.choice "Return", 4
        puts choice
        end
        if choice == 1
            choice = prompt.select("Which module?") do |menu|
                menu.choice "Module 1 - Software Engineering", 1
                menu.choice "Module 2 - Sofware Engineering", 2
                menu.choice "Module 3 - Software Engineering", 3
                menu.choice "Module 4 - Software Engineering", 4
                menu.choice "Module 5 - Software Engineering", 5
                menu.choice "Return", 6
            puts choice
            end
            if choice == 1
                Student.num_of_students(1, "Software Engineering")
                prospective_student
            elsif choice == 2
                Student.num_of_students(2, "Software Engineering")
                prospective_student
            elsif choice == 3
                Student.num_of_students(3, "Software Engineering")
                prospective_student
            elsif choice == 4
                Student.num_of_students(4, "Software Engineering")
                prospective_student
            elsif choice == 5
                Student.num_of_students(5, "Software Engineering")
            elsif choice == 6
                prospective_student
            end
        elsif choice == 2
            choice = prompt.select("Which module?") do |menu|
                menu.choice "Module 1 - Data Science", 1
                menu.choice "Module 2 - Data Science", 2
                menu.choice "Module 3 - Data Science", 3
                menu.choice "Module 4 - Data Science", 4
                menu.choice "Module 5 - Data Science", 5
                menu.choice "Return", 6
            puts choice
            end
            if choice == 1
                Student.num_of_students(1, "Data Science")
                prospective_student
            elsif choice == 2
                Student.num_of_students(2, "Data Science")
                prospective_student
            elsif choice == 3
                Student.num_of_students(3, "Data Science")
                prospective_student
            elsif choice == 4
                Student.num_of_students(4, "Data Science")
                prospective_student
            elsif choice == 5
                Student.num_of_students(5, "Data Science")
            elsif choice == 6
                prospective_student
            end
        elsif choice == 3
            choice = prompt.select("Which module?") do |menu|
                menu.choice "Module 1 - UI/UX Experience", 1
                menu.choice "Module 2 - UI/UX Experience", 2
                menu.choice "Module 3 - UI/UX Experience", 3
                menu.choice "Module 4 - UI/UX Experience", 4
                menu.choice "Module 5 - UI/UX Experience", 5
                menu.choice "Return", 6
            puts choice
            end
            if choice == 1
                Student.num_of_students(1, "UI/UX Experience")
                prospective_student
            elsif choice == 2
                Student.num_of_students(2, "UI/UX Experience")
                prospective_student
            elsif choice == 3
                Student.num_of_students(3, "UI/UX Experience")
                prospective_student
            elsif choice == 4
                Student.num_of_students(4, "UI/UX Experience")
                prospective_student
            elsif choice == 5
                Student.num_of_students(5, "UI/UX Experience")
            elsif choice == 6
                prospective_student
            end
        elsif choice == 4
            prospective_student
        end
    elsif
        answer == 4
        who_am_i
    end
end

def headmaster
    prompt = TTY::Prompt.new
    answer = prompt.select("Hello, what would you like to do today?") do |menu|
        menu.choice 'Who are all the teachers at Flatiron School and their contact information?', 1
        menu.choice 'How long has each teacher been teaching?', 2
        menu.choice 'How many students are in a course and module?', 3
        menu.choice 'I would like to remove a student from the database.', 4
        menu.choice 'I would like to remove a teacher from the database.', 5
        menu.choice 'Go back to main menu.', 6
    end
    if answer == 1
        Teacher.all_teachers_and_email
        headmaster
    elsif
        answer == 2
        Teacher.all_teachers_and_experience
        headmaster
    elsif
        answer == 3
        choice = prompt.select("Which course?") do |menu|
            menu.choice "Software Engineering", 1
            menu.choice "Data Science", 2
            menu.choice "UI/UX Experience", 3
            menu.choice "Return", 4
        puts choice
        end
        if choice == 1
            choice = prompt.select("Which module?") do |menu|
                menu.choice "Module 1 - Software Engineering", 1
                menu.choice "Module 2 - Sofware Engineering", 2
                menu.choice "Module 3 - Software Engineering", 3
                menu.choice "Module 4 - Software Engineering", 4
                menu.choice "Module 5 - Software Engineering", 5
                menu.choice "Return", 6
            puts choice
            end
            if choice == 1
                Student.num_of_students(1, "Software Engineering")
                headmaster
            elsif choice == 2
                Student.num_of_students(2, "Software Engineering")
                headmaster
            elsif choice == 3
                Student.num_of_students(3, "Software Engineering")
                headmaster
            elsif choice == 4
                Student.num_of_students(4, "Software Engineering")
                headmaster
            elsif choice == 5
                Student.num_of_students(5, "Software Engineering")
            elsif choice == 6
                headmaster
            end
        elsif choice == 2
            choice = prompt.select("Which module?") do |menu|
                menu.choice "Module 1 - Data Science", 1
                menu.choice "Module 2 - Data Science", 2
                menu.choice "Module 3 - Data Science", 3
                menu.choice "Module 4 - Data Science", 4
                menu.choice "Module 5 - Data Science", 5
                menu.choice "Return", 6
            puts choice
            end
            if choice == 1
                Student.num_of_students(1, "Data Science")
                headmaster
            elsif choice == 2
                Student.num_of_students(2, "Data Science")
                headmaster
            elsif choice == 3
                Student.num_of_students(3, "Data Science")
                headmaster
            elsif choice == 4
                Student.num_of_students(4, "Data Science")
                headmaster
            elsif choice == 5
                Student.num_of_students(5, "Data Science")
            elsif choice == 6
                headmaster
            end
        elsif choice == 3
            choice = prompt.select("Which module?") do |menu|
                menu.choice "Module 1 - UI/UX Experience", 1
                menu.choice "Module 2 - UI/UX Experience", 2
                menu.choice "Module 3 - UI/UX Experience", 3
                menu.choice "Module 4 - UI/UX Experience", 4
                menu.choice "Module 5 - UI/UX Experience", 5
                menu.choice "Return", 6
            puts choice
            end
            if choice == 1
                Student.num_of_students(1, "UI/UX Experience")
                headmaster
            elsif choice == 2
                Student.num_of_students(2, "UI/UX Experience")
                headmaster
            elsif choice == 3
                Student.num_of_students(3, "UI/UX Experience")
                headmaster
            elsif choice == 4
                Student.num_of_students(4, "UI/UX Experience")
                headmaster
            elsif choice == 5
                Student.num_of_students(5, "UI/UX Experience")
            elsif choice == 6
                headmaster
            end
        elsif choice == 4
            headmaster
        end
    elsif
        answer == 4
        puts "What is the name of the student you are looking for?"
        name = gets.chomp
        Student.delete_student_from_database_by_name(name)
        headmaster
    elsif
        answer == 5
        puts "What is the name of the teacher you are looking for?"
        name = gets.chomp
        Teacher.delete_teacher_from_database_by_name(name)
        headmaster
    elsif
        answer == 6
        who_am_i
    end

end
end
