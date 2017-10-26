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
                p1_name text,
                p2_name text,
                winner text,
                time time)");
    rescue PG::Error => e
      puts e.message
    ensure
      d_base.close if d_base
    end
  end	
###((((((()))))))((((((()))))))(UpD_TABLE)((((((()))))))((((((()))))))###
def add_entry(p1_name,
              p2_name,
              winner)
  begin
    db_info = {
      host: ENV['RDS_HOST'],
      port: ENV['RDS_PORT'],
      dbname: ENV['RDS_DB_NAME'],
      user: ENV['RDS_USERNAME'],
      password: ENV['RDS_PASSWORD']
      }
    d_base = PG::Connection.new(db_info)
    d_base.exec("INSERT INTO public.scoreboard(p1_name,p2_name,winner)VALUES('#{p1_name}','#{p2_name},'#{winner}')");            
  rescue PG::Error => e
    puts e.message
  ensure
    d_base.close if d_base
  end  
 end
###((((((()))))))((((((()))))))(SCOREBOARD)((((((()))))))((((((()))))))###
def get_scores(score)
  begin
    db_info = {
    host: ENV['RDS_HOST'],
    port: ENV['RDS_PORT'],
    dbname: ENV['RDS_DB_NAME'],
    user: ENV['RDS_USERNAME'],
    password: ENV['RDS_PASSWORD']
    }
  d_base = PG::Connection.new(db_info)

  list = d_base.exec("SELECT * FROM public.scoreboard")
            
  rescue PG::Error => e
    puts e.message
  ensure
    d_base.close if d_base
  end

end 
###((((((()))))))((((((()))))))((((((()))))))((((((()))))))###