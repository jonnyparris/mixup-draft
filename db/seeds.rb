require "./config/environment"
require 'faker'

Producer.create(producer_name: 'D-Rok', 
								email: 'drop@dabass.com', 
								password: 'pop', 
								password_confirmation: 'pop')
Producer.create(producer_name: 'J-dizzle', 
								email: 'drop@damelody.com', 
								password: 'pop', 
								password_confirmation: 'pop')
Producer.create(producer_name: 'Pharell', 
								email: 'sofucking@happy.com', 
								password: 'pop', 
								password_confirmation: 'pop')
Producer.create(producer_name: 'Rick Rubin', 
								email: 'sofucking@metal.com', 
								password: 'pop', 
								password_confirmation: 'pop')

Circle.create(name: 'Xmas Giggles', 
							signup_deadline: '1/12/2014', 
							submit_deadline: '25/12/2014')

Stem.create(track_name: 'Peanut Butter Jammin',
						download_url: "http://www.reddit.com/r/IsolatedVocals/top/", 
						producer: Producer.first)

Remix.create(circle: Circle.first, 
					stem: Stem.first)

