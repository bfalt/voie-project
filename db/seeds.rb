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
  Agent.create!(
    user: User.all[n],
    company_name: Faker::Company.name,
    company_address: company_address[n-1]
  )
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
   photo: Rails.root.join("app", "assets", "images", "houses", "House1.jpeg"),
   address: "410 Consuelo Drive, Santa Barbara, CA 93110"
  },

  {title: "F Street Beauty" ,
   description: "5 bedroom 4 bath, 3,600 square feet. Built in 1992. This is my third home, second home together with my husband.",
   user: users[1],
   photo: Rails.root.join("app", "assets", "images", "houses", "House2.jpg"),
   address: "501 West Broadway, Suite 1050, San Diego, CA 92101"
  }
]

job_listing.each do |item|
  job = JobListing.new(item)
  job.photos.attach(io: URI.open(item[:photo]), filename: job.title + '.jpg', content_type: "image/jpg")
  job.save!
end

puts "Job listings created!"

puts "Creating services ..."
services = [

  {category: "Home Value Estimate",
   description: "A crucial step in the home selling process is to determine a price before it goes on the market. Your agent will create a comparative market analysis (CMA) to review comparable homes nearby that are currently on the market, pending, or have recently sold. This will give you more information on what people are willing to pay for homes that are similar to yours, so you can set a competitive price. "
  },
  {category: "Staging",
   description: "Preparing your property is an art and needs attention if you want to maximize your sale price. Agents often say, “proper preparation prevents poor performance.” Your agent will help you “stage” your home so that it makes a positive first impression among potential buyers, from the time they look at the listing photos, to the moment they walk in the door. The first step in staging a home is removing any excess furniture and clutter to make the room feel larger and to help the buyer visualize the space. It’s best to leave some furniture in the room, so that buyers can picture where their own furniture will go, but not so much that the room feels small."
  },
  {category: "Photography",
   description: "Because not all photos are created equal! Knowing the art of photography, intimaetly, can be the difference between someone saying, 'Let's skip this house', vs, 'Yes! Let's see it!' Many buyers who live out of the state or the country want to complete a 3D Walkthrough of your property before they waste their time and money to tour it in-person. Having professional photos can make all the difference."
  },
  {category: "List your home",
   description: "The most basic, yet one of the most important steps! We understand that you may posess the know how when it comes to staging, negotiations, or any other step in the home buying process. In fact, it's probably why you came here! This is our top requested service! Allow us to list your home, so you can wait for the offers to come pouring in."
  },
  {category: "Contracts",
   description: "Who says that real estate writing can’t be exciting? Real estate is filled with political intrigue, ancient and new laws, old buildings full of history, mindboggling maps, secret rooms, and even magic — making small rooms appear large, and large rooms seem cozy. Real estate (such as laws, zoning, contracts, taking title) is different in every state with some nuances for city and county properties. Let us read all the trade and consumer publications to keep up with current topics in your state, follow interest rates, understand new or revised laws, and know the local market."
  },
  {category: "Negotiations",
   description: "The most effective negotiations aren't always about winning, but rather about getting good results for ourselves and our negotiating partners, while maintaining positive working relationships which can be crucial in future interactions. We work together, with you, for next negotiation with careful analysis, effective process management, and the trusted four-step process"
  }
]

Service.create!(services)

puts "Services created!"

puts "Creating job_listing_categories ..."

jl_categories =[
  {service: Service.find(2),
    job_listing: JobListing.find(1)
  },
  {service: Service.find(3),
    job_listing: JobListing.find(1)
  },
  {service: Service.find(4),
    job_listing: JobListing.find(2)
  },
  {service: Service.find(3),
    job_listing: JobListing.find(2)
  },
   {service: Service.find(6),
    job_listing: JobListing.find(2)
  },
  {service: Service.find(5),
    job_listing: JobListing.find(2)
  }
]

JobListingCategory.create!(jl_categories)

puts "Job Listing Categories created!"

puts "Creating professions ..."

professions = [
  {category: "Lawyer"},
  {category: "Staging Expert"},
  {category: "Photographer"},
  {category: "Real Estate Agent"},
  {category: "Home Inspector"},
  {category: "Mover"}
]

Profession.create!(professions)
puts "professions created!"

profession_categories =[
  {profession: Profession.find(2),
    agent: Agent.find(1)
  },
  {profession: Profession.find(3),
    agent: Agent.find(2)
  },
  {profession: Profession.find(4),
    agent: Agent.find(2)
  },
  {profession: Profession.find(3),
    agent: Agent.find(3)
  },
   {profession: Profession.find(6),
    agent: Agent.find(4)
  },
  {profession: Profession.find(5),
    agent: Agent.find(4)
  }
]

AgentProfession.create!(profession_categories)

puts "Agent professions created!"
