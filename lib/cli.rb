require "tty-prompt"

class CommandLineInterface
def greet
    puts "Welcome to Flatiron school."    
end

def who_am_i
    prompt = TTY::Prompt.new 
    # puts "Press '1' if you are a student."
    # puts "Press '2' if you are a teacher."
    # puts "Press '3' if you are a recuiter."
    # puts "Press '4' if you are a prospective student."
    answer = prompt.select("Please select your position.") do |menu|
    menu.choice 'Student', 1
    menu.choice 'Teacher', 2
    menu.choice 'Recruiter', 3
    menu.choice 'Prospective Student', 4
    menu.choice 'Headmastser', 5
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
    elsif
        answer == 3

    elsif
        answer == 4
        prospective_student
    else

    end
end


def student(student_name)
    prompt = TTY::Prompt.new
    answ = prompt.select("Hello #{student_name}, what would you like to do today?") do |menu|
        menu.choice 'I would like to see all of my teachers.', 1
        menu.choice 'I have passed my coding project and am upgrading a module.', 2
        menu.choice 'I would like to see all of the contact information for the students in my course.', 3
        menu.choice 'I would like to see all of the contact information for the students in my module.', 4
        menu.choice 'Go back to main menu.', 5
        end
    puts = answ
    if answ == 1
        std = Student.find_by(name: student_name)
        std.my_teachers
    elsif
        answ == 2
        std = Student.find_by(name: student_name)
        std.finish_coding_project
    elsif
        answ == 3
        std = Student.find_by(name: student_name)
        std.all_students_emails_from_my_course
    elsif
        answ == 4
        std = Student.find_by(name: student_name)
        std.all_students_emails_from_my_module
    elsif answ == 5
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
        Teacher.all_teachers
    elsif
        answer == 2
        Teacher.all_teachers_and_experience
    elsif
        answer == 3
        puts "What course are you interested in?"
        course = gets.chomp
        puts "What module are you interested in?"
        mod = gets.chomp
        Student.num_of_students(mod, course)
    elsif
        answer == 4
        who_am_i
    end
end

end

# def num_of_students
#     prompt = TTY::Prompt.new
#     answer = prompt.select("Which course are you interested in?") do |menu|
#         Data Science, UI/UX Experience, Software Engineer
#         menu.choice 'Data Science', 1
#         menu.choice 'UI/UX Experience', 2
#         menu.choice 'Software Engineer', 3
#         menu.choice 'Go back to main menu.', 4
#     end
#     puts = answer
#     if answer == 1

#     elsif
#         answer == 2

#     elsif
#         answer == 3

#     elsif
#         answer == 4

#     end
# end