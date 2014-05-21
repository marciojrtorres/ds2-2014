require 'sinatra'
require 'mysql'

get '/insert' do
    con = Mysql.new 'localhost', 'root', 'root', 'teste'
    con.query "insert into teste values ('#{params['valor']}')"
    con.close
end