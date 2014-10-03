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
	# output newly mixed circle as a hash
	stems = circle.remix.map { |remix| remix.stem }
	n = (1..stems.length-1).to_a.sample
	remixers = stems.map { |stem| stem.producer}
	remixers.rotate!(n)
	@allocations = Hash[stems.zip(remixers)]
	
	@allocations.each do |stem,producer|
		circle.remix.each do |remix|
			if remix.stem == stem
				remix.remixer_id = stem.producer_id
			end
		end

		if current_user.producer_name == producer.producer_name
			@current_user_match = {producer: stem}
		end
	end

	p"*"*80
	p "rotated by #{n}"
	p "#{current_user.producer_name} has this allocation: #{@current_user_match}"
	p "New circle state: #{circle.remix.each { |remix| remix.name } }"
	p"*"*80
	@current_user_match
end