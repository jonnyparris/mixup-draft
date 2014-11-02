> **Note**: Work in progress - this was built in Sinatra as a learning step towards Ruby on Rails. Watch this space for a rails version.

#Mixup

###the idea
Think secret santa gift giving, but for music makers instead.

1. You submit a pack of stems to a track you created to a circle of producers (like names in a hat).
2. You receive a pack of stems at random from the circle.
3. You create beautiful new remix with those stems.
4. On the deadline (xmas day!), you both send and receive some sweet new musical creations.

###the code
* Built with a fairly skinny Sinatra skeleton, as a means to build out a full stack application.
* The schema is pretty efficient but confusing as a result.
* There's a full suite of model tests in Rspec used for TDDing the schema...painstakingly slowly as it was my first time getting intimate with ActiveRecord on my own.
* Foundation is powering the brunt of the front end, with some cheeky google images copypasta.

###the future
Secure and deployed rails app...and some excited music producers, fingers crossed!
