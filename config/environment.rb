require 'bundler'
Bundler.require
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.level= :error
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

require_all 'lib'