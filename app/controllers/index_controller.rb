#----------- Landing Page -----------
get '/' do
	erb :index
end

#----------- Users -----------
post '/signup' do
	user = Producer.new(params[:user])
 	user.password = params[:user][:password]
 	
 	if user.valid?
	 	user.save!
	 	session[:user] = user.id
	 	redirect '/dashboard'
	else
 		user.errors.full_messages.to_json
 	end
end

#----------- Sessions -----------

# login with API??

post	'/login' do
	@user = find_user
	if @user && @user.password == params[:password]
 		session[:user] = @user.id
	else
		error = "nah bruv, try again"
	end
	redirect '/dashboard'
end

delete '/logout/:id' do
	logout
end

#----------- Dashboard -----------
get '/dashboard' do
	if current_user
		erb :dashboard
	else
		@error = "Please login to view that page!"
		erb :index
	end
end

#----------- Stems -----------
# create stem
post '/add_stem' do
	Stem.create(params)
	Stem.last.to_json
end

# view stems
get '/stems' do
	Stem.all.to_json
end

# view my stems
get '/stems/producer/:id' do
	Stem.all.where(producer: params[:producer]).to_json
end

#----------- Circles -----------
# create circle
post '/add_circle' do
	Circle.create(params)
	Circle.last.to_json
end

# view circles
get '/circles' do
	Circle.all.to_json
end

# submit stem to circle
post '/circles/:id/stems/:id' do
	add_stem = Circle.find(params[:circle_id]).stems.create(params[:stem])
	add_stem.to_json
end

# mixup a circle, allocate remixes
post '/circles/:id/mixup' do
	circle = Circle.find(params[:circle_id])
	mixup(circle).to_json
end

# submit remix
post '/circles/:id/remix' do

end

# view remixes
get '/remixes' do
	Remix.all.to_json
end