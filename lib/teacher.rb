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

end
