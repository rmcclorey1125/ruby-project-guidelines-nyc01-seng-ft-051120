class Teacher < ActiveRecord::Base

    has_many :students, through: :bootcamp
    belongs_to :bootcamp

    def my_students
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
        Teacher.all.map do |t|
            "#{t.name} has #{t.experience} years of experience."
        end
    end

    def self.get_teacher_emails_by_course(course)
        Teacher.all.select do |t|
           t.course == course
            end.map do |t|
                "#{t.name} - #{t.email}"
        end
    end

    def self.all_teachers
        Teacher.all
    end

    def self.all_teachers_by_course(course)
        Teacher.all.select do |t|
           t.course == course
        end
    end
            
end
