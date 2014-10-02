def find_user
	@user = Producer.find_by(email: params[:email])		
end

def current_user
  @user = Producer.find(session[:user]) if session[:user]
end

def logout
	session[:user] = nil
end