get '/' do
	erb :welcome
end
get '/sessions/new' do
	erb :'sessions/new'
end 

get '/sessions/delete' do
  session[:user_id] = nil
  redirect '/'
end

post '/sessions/new' do
	@user = User.find_by(username: params[:username])
	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
			redirect '/hello'
	else
			@error = "Your login credentials are wrong, please try again"
			erb :'/sessions/new'
	end
end

get '/welcome' do
	erb :welcome
end



get '/hello' do
	erb :'/hello'
end

