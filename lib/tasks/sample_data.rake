namespace :db do
  desc "Fill database with sample data"
	task :populate => :environment do
	    	Rake::Task['db:reset'].invoke
    		make_users
    		make_microposts
    		make_relationships
	end
end


def make_users

	admin = User.create!(:name => "Aaron Person",
                         :email => "aaron.person@eircom.net",
                         :password => "password9",
                         :password_confirmation => "password9")
	admin.toggle!(:admin)

	admin = User.create!(:name => "Gerard Tamakloe",
                         :email => "gerrytam@eircom.net",
                         :password => "password9",
                         :password_confirmation => "password9")
	admin.toggle!(:admin)

	39.times do |n|
		firstName = Faker::Name.first_name
		lastName =  Faker::Name.last_name
		name  = "#{firstName} #{lastName}"
		email = "#{firstName}.#{lastName}@gmail.com".downcase.gsub(/' /,'')
		password  = "password"
		User.create!(:name => name,
			:email => email,
			:password => password,
			:password_confirmation => password)
	end
end


def make_microposts

	10.times do
		User.all(:limit => 41).each do |user|
		content = Faker::Lorem.sentence(5)
		user.microposts.create!(:content => content)
		end
	end
end


def make_relationships
	users = User.all
	user  = users.first
	following = users[1..50]
	followers = users[3..40]
	following.each { |followed| user.follow!(followed) }
	followers.each { |follower| follower.follow!(user) }
end

