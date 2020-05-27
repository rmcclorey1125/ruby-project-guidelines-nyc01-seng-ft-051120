class Teacher < ActiveRecord::Base

    has_many :students, through: :bootcamp
    belongs_to :bootcamp

    def my_students
        #teacher
        my_students = []
        Bootcamp.all.each do |b|
            if self.module <= b.student.module && self.course == b.student.course
                my_students << b.student
                end
        end
        my_students.map do |t|
            t.name
        end.uniq
    end

    def self.experience
        #prospectivestudent
        Teacher.all.map do |t|
            "#{t.name} has #{t.experience} years of experience."
        end
    end

    def self.search_teacher(teacher_name)
        #teacher
        Teacher.all.select do |teacher|
            teacher.name == teacher_name
        end
    end

    def self.search_teachers_in_module(mod)
        #student - christa
        Teacher.all.select do |teacher|
            teacher.module == mod
        end
    end

    def self.teachers_emails_by_course(course)
        #student - aleksandra
        #prospectivestudent
        Teacher.all.select do |t|
            t.course == course
        end.map do |t|
            "#{t.name} - #{t.email}"
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


end
