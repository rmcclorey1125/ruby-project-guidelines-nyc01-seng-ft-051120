require_relative '../config/environment'

require_relative '../lib/bootcamp.rb'
require_relative '../lib/student.rb'
require_relative '../lib/teacher.rb'
require_relative '../lib/cli.rb'

class CommandLineInterface
cli = CommandLineInterface.new
cli.greet
cli.who_am_i
cli.


all_students_from_my_course("Software Engineering")