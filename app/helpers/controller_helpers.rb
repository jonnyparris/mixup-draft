def find_user
	@user = Producer.find_by(email: params[:email])		
end

def current_user
  @user = Producer.find(session[:user]) if session[:user]
end

def logout
	session[:user] = nil
end

def mixup(circle)
	# assign remixer IDs to stem owners at random
	# output newly mixed circle
end