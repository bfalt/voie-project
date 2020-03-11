#DONT RUN rails db:seed,
#Instead run rails db:reset.
#Do this keeping in mind the id's associated with the seeds. They're important!


require 'faker'
require "open-uri"

puts "Destroying all users from database!"
User.destroy_all
puts "All users are DESTROYED from database!"

puts "Creating new Agents...."

users_agents = [
 #create 19 of these "users" which are my agents!
 # 12 female agents, 7 male agents.
  {email: Faker::Internet.email,
   password: "password",
   first_name: "Meaghan",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "F_Agent1.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Adalee",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "F_Agent2.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Palmer",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "F_Agent3.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Karolyn",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "F_Agent4.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Oaklynn",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "F_Agent5.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Yara",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "F_Agent6.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Cleo",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "F_Agent7.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Elodie",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "F_Agent8.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Lila",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "F_Agent9.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Imogen",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "F_Agent10.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Eleanor",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "F_Agent11.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Camilla",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "F_Agent12.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Logan",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "M_Agent1.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Chris",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "M_Agent2.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Daniel",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "M_Agent3.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },


  {email: Faker::Internet.email,
   password: "password",
   first_name: "Lucas",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "M_Agent4.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Henry",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "M_Agent5.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Sebastian",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "M_Agent6.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  },

   {email: Faker::Internet.email,
   password: "password",
   first_name: "Jack",
   last_name: Faker::Name.last_name,
   photo: Rails.root.join("app", "assets", "images", "agents", "M_Agent7.jpg"),
   phone_number:Faker::PhoneNumber.cell_phone
  }
]

users_agents.each do |user_attr|
  user = User.new(user_attr)
  user.photos.attach(io: URI.open(user_attr[:photo]), filename: user_attr[:first_name], content_type: "image/jpg")
  user.save!
end

puts "new Agents created...."

#19 good addresses for agents "company addres"
company_address = ["8605 Santa Monica Blvd, West Hollywood, CA 90069", "548 Market St, San Francisco, CA 94104", "PO Box 7775, San Francisco, CA 94120", "237 A St, San Diego, CA 92101", "PO Box 515381, Los Angeles, CA 90051", "4110 Norris Avenue, Sacramento, CA 95821", "633 W. 5th Street, 28th Floor, Los Angeles, CA 90071", "5301 Power Inn Rd., Sacramento, CA 95820", "705 16th St., Suite 200B, San Diego, CA 92101", "7701 Hershel Ave, La Jolla, CA 92037", "7330 Golden Star Lane, Carlsbad, CA 92011", "2140 W Lomita Blvd, Lomita, CA 90717", "5755 Valentine Rd. Suite 302, Ventura, CA 93003", "923 Drever Street, West Sacramento, CA 95691", "5218 York Blvd, Los Angeles, CA 90042", "5337 Malcolm Street, Oceanside, CA 92056", "1936 14th Street, Suite 100, Santa Monica, CA 90404", "4700 Teller Avenue, Newport Beach, CA 92660", "4122 E Chapman Avenue, Suite 24, Orange, CA 92869", "1817 Morena Blvd, Suite A, San Diego, CA 92110", "303 A Street, Suite 300, San Diego, CA 92101"]

puts "i'm here ...."

19.times do |n| #or however many agents i'm making
  Agent.create!({user: User.find(n+1),
   company_name: Faker::Company.name,
   company_address: company_address[n-1]
  })
end

puts "Creating new homeowners ...."

users_homeowner = [
#make as many homeowners as I want below!
#my first two homeowners (ID 20 and 21) will have created job listings associated with them.


  {email: Faker::Internet.email,
   password: "password",
   first_name: "Jessica",
   last_name: Faker::Name.last_name,
   address: "29574 Hazel Glen Rd, Murrieta, CA 92563",
   photo: Rails.root.join("app", "assets", "images", "users", "F_Headshot1.jpg"),
   phone_number: "(619) 269–8191"
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Michelle",
   last_name: Faker::Name.last_name,
   address: "901 F Street, Sacramento, CA 95814",
   photo: Rails.root.join("app", "assets", "images", "users", "F_Headshot2.jpg"),
   phone_number: "(408) 726–1900"
  },

  {email: Faker::Internet.email,
   password: "password",
   first_name: "Sharon",
   last_name: Faker::Name.last_name,
   address: "110 N Maclay Avenue, San Fernando, CA 91340",
   photo: Rails.root.join("app", "assets", "images", "users", "F_Headshot3.jpg"),
   phone_number: "(818) 302–4445"
  },


  {email: Faker::Internet.email,
   password: "password",
   first_name: "Shirley",
   last_name: Faker::Name.last_name,
   address: "501 S Fairfax Avenue, Suite 212, Los Angeles, CA 90036",
   photo: Rails.root.join("app", "assets", "images", "users", "F_Headshot4.jpg"),
   phone_number: "(305) 402–2248"
  },


  {email: Faker::Internet.email,
   password: "password",
   first_name: "Amanda",
   last_name: Faker::Name.last_name,
   address: "8846 Kester Avenue, Panorama City, CA 91402",
   photo: Rails.root.join("app", "assets", "images", "users", "F_Headshot5.jpg"),
   phone_number: "(818) 895–3002"
  },
]



# users = User.create!(users_homeowner)
users_homeowner.each do |ho|
  user = User.new(ho)
  user.photos.attach(io: URI.open(ho[:photo]), filename: user.first_name + '.jpg', content_type: "image/jpg")
  user.save!
end

puts "Homeowners Created!"

users = User.all.reject { |user| user.agent }
job_listing = [

  {title: "Hazel Glen Home",
   description: "Three bedroom, three bathroom home. 3,000 square feet. I bought the home in 2008 together with my husband. This is our second home together and we're moving to Colorado!",
   user: users[0],
   photo: "../app/assets/images/houses/House1.jpeg",
   address: "410 Consuelo Drive, Santa Barbara, CA 93110"
  },

  {title: "F Street Beauty" ,
   description: "5 bedroom 4 bath, 3,600 square feet. Built in 1992. This is my third home, second home together with my husband.",
   user: users[1],
   photo: "../app/assets/images/houses/House2.jpg",
   address: "501 West Broadway, Suite 1050, San Diego, CA 92101"
  }
]

JobListing.create!(job_listing)
puts "Job listings created!"
