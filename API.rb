require 'sinatra'

get '/' do
  '<title>Login API</title>
<h1>Please login using the API</h1>
<a href="/help">API Help Page</a>'
end

get '/help' do
  '<title>Login API Help</title>
<h1>help</h1>
Returns all methods
<h1>listUsers</h1>
Lists all usernames<br>
Example /listUsers
<h1>login[username, password]</h1>
Login using username and password, redirects to /help on fail<br>
Example /login/[username]/[password]'
end

get '/login/:username/:password' do
  if params['username'].to_s.eql? 'donutsAreGr8'
    if params['password'].to_s.eql? 'Mmj7FnbS'
      '<title>Logged In</title>
Welcome donutsAreGr8!<br>
The flag is MCA-37212FBC'
    else
      redirect '/help'
    end
  else
    redirect '/help'
  end
end

get '/listUsers' do
  '<title>User List</title>
donutsAreGr8'
end

get '/*' do
  redirect '/'
end