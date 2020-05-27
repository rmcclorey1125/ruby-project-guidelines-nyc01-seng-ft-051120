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


end