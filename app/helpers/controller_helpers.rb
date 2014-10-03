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
	members = circle.remix.map { |remix| remix.stem.producer}
	n = (0..members.length-1).to_a.sample
	remixers = members.rotate(n)
	allocations = members.zip(remixers)
end