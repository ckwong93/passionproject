get '/users/new' do
	erb :'/users/new'
end

post '/users/new' do
	user = User.create(username: params[:username], password: params[:password], email: params[:email])
	redirect '/welcome'
end
