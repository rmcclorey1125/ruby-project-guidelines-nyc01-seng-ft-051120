class Teacher < ActiveRecord::Base

    has_many :students, through: :bootcamp
    belongs_to :bootcamp

    def my_students
        #teacher - DONE
        my_students = []
        Bootcamp.all.each do |b|
            if self.module <= b.student.module && self.course == b.student.course
                my_students << b.student
                end
        end
        my_students.uniq.map do |t|
           puts t.name
        end
    end

    def self.all_teachers_and_experience
        #prospectivestudent
        Teacher.all.map do |t|
            "#{t.name} has #{t.experience} years of experience."
        end
    end

    def self.search_teacher(teachers_name)
        #teacher - DONE
        t = Teacher.all.select do |teacher|
            teacher.name == teachers_name
        end.uniq
        t.map do |a|
            puts "#{a.name} is #{a.age} years old. #{a.name} is a teacher for Module ##{a.module} in the #{a.course} course at Flatiron School." 
        end
    end

    def self.search_teachers_by_module(mod)
        #student - DONE
        Teacher.all.select do |teacher|
            teacher.module == mod
        end.map do |t|
        puts "#{t.name}"
        end
    end

    def self.teachers_emails_by_course(course)
        #student - aleksandra
        #prospectivestudent
        Teacher.all.select do |t|
            t.course == course
        end.map do |t|
           puts "#{t.name} - #{t.email}"
        end
    end
    
    def teachers_emails_in_my_course
        #DONE
        all_teach = Teacher.all.where(course: self.course)
        all = all_teach.collect{|s| "#{s.name} - #{s.email}"}
        all.each do |a|
            puts a
        end
    end

    def self.all_teachers
        #student - ronan
        #teacher
        #prospectivestudent
        #headmaster
        Teacher.all.map do |t|
            puts t.name
        end
    end

    def self.all_teachers_from_5_module
        Teacher.all.select do |t|
            t.module == 5
        end.map do |t|
           puts "#{t.course} - #{t.name} - #{t.email}"
        end
    end

    def self.all_teachers_and_email
        #student - ronan
        #teacher
        #prospectivestudent
        #headmaster
        Teacher.all.map do |t|
            puts "#{t.name} - #{t.email}."
        end
    end

    def self.delete_teacher_from_database_by_name(name)
        a = Teacher.find_by(name: name)
            a.delete
            a.save
        puts "Teacher #{name} has been deleted from the database."
    end
end
