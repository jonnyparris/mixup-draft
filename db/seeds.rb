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
            download_url: "https://soundcloud.com/murder-he-wrote/murder-he-wrote-host-g-98-v1-demo", 
            producer: Producer.find(1))
Stem.create(track_name: 'Plumber Anthem',
            download_url: "https://soundcloud.com/innamusic/inna-party-never-ends", 
            producer: Producer.find(2))
Stem.create(track_name: 'For the love of garlic',
            download_url: "https://soundcloud.com/asamusicofficial/without-you-zesrmx", 
            producer: Producer.find(3))
Stem.create(track_name: 'Sensual Wheeling',
            download_url: "https://soundcloud.com/ciaorecs/crookers-picture-this-ft-dilligas-natlek-remix-1", 
            producer: Producer.find(4))

Remix.create(circle: Circle.first, 
            stem: Stem.find(1))
Remix.create(circle: Circle.first, 
            stem: Stem.find(2))
Remix.create(circle: Circle.first, 
            stem: Stem.find(3))
Remix.create(circle: Circle.first, 
            stem: Stem.find(4))

