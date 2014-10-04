#----------- Landing Page -----------
get '/' do
	erb :index
end

#----------- Users -----------
post '/signup' do
	user = Producer.new(params)
 	user.password = params[:password]
 	
 	if user.valid?
	 	user.save!
	 	session[:user] = user.id
	 	redirect '/dashboard'
	else
 		@errors = user.errors.full_messages
 		erb :index
 	end
end

#----------- Sessions -----------

# login with API??

get	'/login' do
	@user = find_user
	if @user && @user.password == params[:password]
 		session[:user] = @user.id
		redirect '/dashboard'
	else
		@error = "nah bruv, try again or sign up!"
		erb :index
	end
end

delete '/logout' do
	logout
end

#----------- Dashboard -----------
get '/dashboard' do
	if current_user
		current_user
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
	erb :'partials/my_stems'
end

# view stems
get '/stems' do
	content_type :json
	Stem.all.to_json
end

# view my stems
get '/stems/producer/:id' do
	content_type :json
	Stem.all.where(producer: params[:producer]).to_json
end

#----------- Circles -----------
# create circle
post '/add_circle' do
	Circle.create(params)
	erb :'partials/circles'
end

# view circles
get '/circles' do
	content_type :json
	Circle.all.to_json
end

# submit stem to circle
post '/circles/:id/stems' do
	stem_id = Stem.find_by(track_name: params[:stem_name]).id
	add_stem = Circle.find(params[:circle_id]).remix.create(stem_id: stem_id)
	content_type :json
	add_stem.to_json
end

# mixup a circle, allocate remixes
post '/circles/:id/mixup' do
	content_type :json
	circle = Circle.find(params[:circle_id])
	mixup(circle).to_json
end

# submit remix
post '/circles/:id/remix' do

end

# view remixes
get '/remixes' do
	content_type :json
	Remix.all.to_json
end