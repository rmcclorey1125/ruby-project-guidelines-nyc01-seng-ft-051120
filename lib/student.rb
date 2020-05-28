class Student < ActiveRecord::Base
   
    has_many :teachers, through: :bootcamp
    belongs_to :bootcamp

    def my_teachers
        #DONE
        my_teachers = []
        Bootcamp.all.each do |b|
            if self.module <= b.teacher.module && self.course == b.teacher.course
                my_teachers << b.teacher
                end
        end
        my_teachers.uniq.map do |t|
           puts "#{t.name}"
        end
    end

    def self.job_seeking
        seekers = Student.all.where(module: 5)
        all = seekers.collect{|s| "#{s.name} - #{s.email}"}
        all.each do |a|
            puts a
        end
    end
    def self.job_seeking_by_course(course)
        seekers = Student.all.where(module: 5)
        cour = seekers.select do |s|
            s.course == course
            puts "#{s.name} - #{s.email}"
        end
    end

    def finish_coding_project
        #DONE
        if self.module == 5
            "Congratulations, you've graduated from Bootcamp!"
        else
            self.module += 1
            self.save
        end
        puts "Your module has been updated to Module ##{self.module}."
    end
    

    def all_students_emails_from_my_course
        #DONE
        # Student instance method - all of the students from my course
        all_std = Student.all.where(course: self.course)
        all = all_std.collect{|s| "#{s.name} - #{s.email}"}
        all.each do |a|
            puts a
        end
        # all_std.map{|std| puts std.name + std.email + std.module.to_s }
    end

    def self.num_of_students(mod, course)
        #teacher - DONE
        #headmaster
        v = Student.all.select do |student|
            student.module == mod && student.course == course
            end
            puts "There are #{v.count} students in Module #{mod} of the #{course} course."
    end

    def all_students_emails_from_my_module
        #DONE
        all_std = Student.all.where(course: self.course)
        all_std.select do |a|
            a.module == self.module
        end.map do |a|
            puts "#{a.name} - #{a.email}"
        end
    end

    def self.delete_student_from_database_by_name(name)
       a = Student.find_by(name: name)
        a.delete
        a.save
        puts "Student #{name} has been deleted from the database."
    end
end