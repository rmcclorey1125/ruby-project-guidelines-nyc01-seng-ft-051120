
class CommandLineInterface
    
    
def greet
    puts "Welcome to Flatiron school."    
end

def who_am_i
    puts "Press '1' if you are a student."
    puts "Press '2' if you are a teacher."
    puts "Press '3' if you are a recuiter."
    puts "Press '4' if you are a prospective student."

    answer = gets.chomp
     if answer == "1"
    puts "What is your name?"
    student_name = gets.chomp
    student(student_name)
     end

    #  elsif
    # answer == 2
         
    #  elsif 
    # answer == 3


    # elsif
    # answer == 4

        
    # else
    #    puts "You need to choose a number from 1 to 4." 


    # end
    # end

end


def student(student_name)

    puts "Hello #{student_name}, what would you like to do today?"
    puts "Press '1' if you want to view all of your teachers."
    puts "Press '2' if you "


    answ = gets.chomp
    if answ == "1"
        std = Student.find_by(name: student_name)
        std.my_teachers
    # binding.pry
    elsif
     answ == 2
    end

end

end