require_relative '../config/environment'
require "tty-prompt"

class CommandLineInterface
prompt = TTY::Prompt.new 
cli = CommandLineInterface.new
cli.greet
cli.who_am_i
end