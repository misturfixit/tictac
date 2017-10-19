require 'pg'
	load './local_env.rb' if File.exist?('./local_env.rb')

###((((((()))))))((((((()))))))((((((MAKETABLE()))))))((((((()))))))###
def maketable()
	begin
	  pbinfo = {
	    host: ENV['RDS_HOST'],
	    port: ENV['RDS_PORT'],
	    dbname: ENV['RDS_DB_NAME'],
	    user: ENV['RDS_USERNAME'],
	    password: ENV['RDS_PASSWORD']
  	}
dbase = PG::Connection.new(pbinfo)
dbase.exec ("CREATE TABLE tictac.pb (
					ID bigserial NOT NULL,
          name text,
          score text)");
	rescue PG::Error => e
	   puts e.message
	ensure
	   dbase.close if dbase
	end
end	
###((((((()))))))((((((()))))))((((((UDTABLE()))))))((((((()))))))###

###((((((()))))))((((((()))))))((((((()))))))((((((()))))))###
###((((((()))))))((((((()))))))((((((()))))))((((((()))))))###