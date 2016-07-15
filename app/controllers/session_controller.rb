get '/' do
	erb:login
end
get '/login' do
	erb :login
end

post '/login' do
	user = User.find_by(username: params[:username])
	if user && user.password == params[:password]
			redirect '/welcome'
	else
			redirect '/login'
	end
end

get '/welcome' do
	erb :welcome
end

get '/users/new' do
	erb :new
end

post '/users/new' do
	user = User.create(username: params[:username], password: params[:password], email: params[:email])
	redirect '/welcome'
end
