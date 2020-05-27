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
        my_teachers.uniq     #map do |t|
        #     t.name
        # end.uniq
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
    

    def all_students_from_my_course(course)
        # Student instance method - all of the students from my course
        all_std = Student.all.where(course: course)
        #  binding.pry
        all_std.each{|std| puts "name: " +std.name + " email: " + std.email + " module: " + std.module.to_s}
        # all_std.map{|std| puts std.name + std.email + std.module.to_s }
    end

      # def self.num_of_students(mod)
    #     Student.all.select do |student|
    #         student.module == mod
    #     end.count
    # end

    def self.num_of_students(mod, course)
        Student.all.select do |student|
            student.module == mod && student.course == course
        end
    end

  

    def all_students_from_my_module(mod_num, course)
    # Student instance method - all of the students in my module and course
    mod = Student.all.where(course: course, module: mod_num) 
    mod.each{|std| puts "name: " +std.name + " email: " + std.email + " module: " + std.module.to_s}
    end
end