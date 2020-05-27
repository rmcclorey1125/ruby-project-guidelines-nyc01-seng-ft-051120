class Student < ActiveRecord::Base
   
    has_many :teachers, through: :bootcamp
    belongs_to :bootcamp

    def my_teachers
        my_teachers = []
        Bootcamp.all.each do |b|
            if self.module <= b.teacher.module && self.course == b.teacher.course
                my_teachers << b.teacher
                end
        end
        my_teachers.map do |t|
            t.name
        end.uniq
    end

    def self.job_seeking
        Student.all.select do |s|
            s.module == 5
        end
    end

    def self.job_seeking_by_course(course)
        self.job_seeking.select do |s|
            s.course == course
        end
    end

    def finish_coding_project
        if self.module == 5
            "Congratulations, you've graduated from Bootcamp!"
        else
            self.module += 1
        end
        self.save
    end


end