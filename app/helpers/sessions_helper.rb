helpers do
  def login(user)
    session[:id] = user.id
  end

  def current_user
    @current_user ||=User.find_by(id: session[:user_id])
  end

end