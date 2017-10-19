require 'pg'
	load './local_env.rb' if File.exist?('./local_env.rb')

###((((((()))))))(((((((()))))))(MAKETABLE)((((((()))))))((((((()))))))###
def maketable()
	begin
	  db_info = {
	    host: ENV['RDS_HOST'],
	    port: ENV['RDS_PORT'],
	    dbname: ENV['RDS_DB_NAME'],
	    user: ENV['RDS_USERNAME'],
	    password: ENV['RDS_PASSWORD']
  	  }
    d_base = PG::Connection.new(db_info)
    d_base.exec ("CREATE TABLE public.scoreboard (
              ID bigserial NOT NULL,
              names text,
              winner text,
              score text)");
	rescue PG::Error => e
	   puts e.message
	ensure
	   d_base.close if d_base
	end
end	
###((((((()))))))((((((()))))))(UpD_TABLE)((((((()))))))((((((()))))))###
def add_entry(data)
  begin
    db_info = {
      host: ENV['RDS_HOST'],
      port: ENV['RDS_PORT'],
      dbname: ENV['RDS_DB_NAME'],
      user: ENV['RDS_USERNAME'],
      password: ENV['RDS_PASSWORD']
      }
    d_base = PG::Connection.new(db_info)
    d_base.exec("INSERT INTO public.scoreboard(names,winner,score)VALUES('#{data[0]} ','#{data[1]}','#{data[2]}')");            
  rescue PG::Error => e
    puts e.message
  ensure
    d_base.close if d_base
  end  
 end
###((((((()))))))((((((()))))))(SCOREBOARD)((((((()))))))((((((()))))))###
def scoreboard(score)
  begin
    db_info = {
    host: ENV['RDS_HOST'],
    port: ENV['RDS_PORT'],
    dbname: ENV['RDS_DB_NAME'],
    user: ENV['RDS_USERNAME'],
    password: ENV['RDS_PASSWORD']
    }
  d_base = PG::Connection.new(db_info)
  show = d_base.exec("SELECT * FROM public.scoreboard")

  rescue PG::Error => e
    puts e.message
  ensure
    d_base.close if d_base
  end
  show
end 
###((((((()))))))((((((()))))))((((((()))))))((((((()))))))###