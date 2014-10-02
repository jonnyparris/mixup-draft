get '/' do
	erb :index
end

# create users
post '/signup' do
	user = Producer.new(params[:user])
 	user.password = params[:user][:password]
 	
 	if user.valid?
	 	user.save!
	else
 		user.errors.full_messages
 	end
end

# login
get	'/signin' do
	@user = find_user
	if @user && @user.password == params[:password]
 		session[:user] = @user.id
	else
		error = "nah bruv, try again"
	end
end

# logout
get '/logout' do
	logout
end

# create stem
# view stems


# create circle
# view circles


# submit stem to circle
# mixup a circle, allocate remixes

# submit remix
# view remixes

# login with API
# login to dropbox and download stems