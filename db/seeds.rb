# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.crease([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#CONTENT = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore"
require 'rubygems'
require 'open-uri'
require 'pry'
#require 'curb'
require 'nokogiri'

User.delete_all
School.delete_all
Review.delete_all

User.create(username: "admin", password: "admin", email:'admin@gmail.com', is_admin: true)

user1 = User.create(username: "maja",password: "secret", email:"maja@gmail.com", picture: "https://s3.amazonaws.com/uifaces/faces/twitter/pixeliris/128.jpg", bio: "Venmo blog heirloom, typewriter neutra chartreuse quinoa ennui vegan narwhal. Slow-carb fashion axe gluten-free mixtape authentic meggings pour-over, beard everyday carry brunch organic. Craft beer venmo PBR&B lomo viral portland normcore, cray kickstarter banh mi. Meggings wayfarers swag kinfolk, mlkshk DIY fashion axe chicharrones bushwick cred. Swag fap narwhal, iPhone fixie yuccie vinyl truffaut cronut selfies kombucha sriracha farm-to-table mlkshk wolf. Echo park 90's vegan gastropub put a bird on it. Truffaut pug irony tousled gentrify PBR&B pour-over kinfolk intelligentsia.", contact_link: "@maja")
user2 = User.create(username: "jane",password: "jane1", email:"jane@gmail.com", picture: "https://s3.amazonaws.com/uifaces/faces/twitter/madysondesigns/128.jpg", bio: "Venmo blog heirloom, typewriter neutra chartreuse quinoa ennui vegan narwhal. Slow-carb fashion axe gluten-free mixtape authentic meggings pour-over, beard everyday carry brunch organic. Craft beer venmo PBR&B lomo viral portland normcore, cray kickstarter banh mi. Meggings wayfarers swag kinfolk, mlkshk DIY fashion axe chicharrones bushwick cred. Swag fap narwhal, iPhone fixie yuccie vinyl truffaut cronut selfies kombucha sriracha farm-to-table mlkshk wolf. Echo park 90's vegan gastropub put a bird on it. Truffaut pug irony tousled gentrify PBR&B pour-over kinfolk intelligentsia.", contact_link: "@jane")
user3 = User.create(username: "miguel",password: "miguel1", email:"miguel@gmail.com", picture: "https://s3.amazonaws.com/uifaces/faces/twitter/akifyaldir/128.jpg", bio: "Venmo blog heirloom, typewriter neutra chartreuse quinoa ennui vegan narwhal. Slow-carb fashion axe gluten-free mixtape authentic meggings pour-over, beard everyday carry brunch organic. Craft beer venmo PBR&B lomo viral portland normcore, cray kickstarter banh mi. Meggings wayfarers swag kinfolk, mlkshk DIY fashion axe chicharrones bushwick cred. Swag fap narwhal, iPhone fixie yuccie vinyl truffaut cronut selfies kombucha sriracha farm-to-table mlkshk wolf. Echo park 90's vegan gastropub put a bird on it. Truffaut pug irony tousled gentrify PBR&B pour-over kinfolk intelligentsia.", contact_link: "@miguel")
user4 = User.create(username: "team",password: "team1", email:"team@gmail.com", picture: "https://s3.amazonaws.com/uifaces/faces/twitter/_everaldo/128.jpg", bio: "Venmo blog heirloom, typewriter neutra chartreuse quinoa ennui vegan narwhal. Slow-carb fashion axe gluten-free mixtape authentic meggings pour-over, beard everyday carry brunch organic. Craft beer venmo PBR&B lomo viral portland normcore, cray kickstarter banh mi. Meggings wayfarers swag kinfolk, mlkshk DIY fashion axe chicharrones bushwick cred. Swag fap narwhal, iPhone fixie yuccie vinyl truffaut cronut selfies kombucha sriracha farm-to-table mlkshk wolf. Echo park 90's vegan gastropub put a bird on it. Truffaut pug irony tousled gentrify PBR&B pour-over kinfolk intelligentsia.", contact_link: "@team")


# school1 = School.create(name: 'Galvanize', webpage:"www.galvanize.com", logo: 'https://pbs.twimg.com/profile_images/466302895374077952/YEhmrkGJ_400x400.jpeg', address: '44 Tehama St, San Francisco, CA 94105', description: "Galvanize Full Stack is a 24-week program that teaches you how to make an impact as a contributing member of a development team. The program culminates in hiring day, where students meet potential employers, present projects, and show off everything they’ve learned.")
# school2 = School.create(name: 'Hack Reactor', webpage:"www.hackreactor.com", logo: 'https://pbs.twimg.com/profile_images/3600401155/9f6fa621f8b19a275b08486d93b42cbe_400x400.png', address: '944 Market St., San Francisco, CA 94103', description: "Founded in 2012 by Anthony Phillips and Douglas Calhoun (formerly Catalyst), Hack Reactor is a 12-week software engineering course that promises to teach students how to think like engineers and build production-grade web applications. The program emphasizes project-based learning, hack/pair programming, and industry tools like Git, Backbone, Rails, Unix, and TDD testing frameworks. Hack Reactor is self-admittedly not a '0 to 60' course, it is instead a '20 to 120' course and expects successful applicants to have written some code independently or through online e-learning platforms. Hack Reactor is looking for students who exemplify the following: passionate, intelligent learners; clear, empathetic communicators; and dedicated, curious coders. The program is designed with students' job searches in mind and promises graduates will leave with a strong Github presence, tons of technical interview experience, a personal website, updated resume, and LinkedIn profile. Hack Reactor boasts a 98% graduate hiring rate placing alumni in web development positions at companies like Adobe, Groupon, and SalesForce.")
# school3 = School.create(name: 'General Assembly', webpage:"www.generalassemly.com", logo: 'https://pbs.twimg.com/profile_images/616323696601468930/SkNd2ppU.png', address: '414 Brannan Street, San Francisco, CA 94107', description: "General Assembly aims to create a global community of individuals empowered to pursue work they love, by offering full-time immersive programs, long-form courses, and classes and workshops on the most relevant skills of the 21st century – from web development and user experience design, to business fundamentals, to data science, to product management and digital marketing. Established in early 2011 as an innovative community in New York City for entrepreneurs and startup companies, General Assembly is an educational institution that transforms thinkers into creators through education in technology, business and design at nine campuses across four continents.")
# school4 = School.create(name: 'App Academy', webpage:"www.appacademy.com", logo: 'http://www.appacademy.io/assets/site/app-academy-logo-sharing.png', address: '160 Folsom St, San Francisco, CA 94105', description: "Founded in 2012 by Ned Ruggeri and Kush Patel, App Academy is an immersive 12-week Ruby-focused web development course with campuses in San Francisco and New York City. Students interested in this intense program should expect to put in 90-100 hours per week. Upon graduation, students will have a portfolio of real world projects to show to prospective employers.")
# School.create(name: 'Angelhack', webpage:"http://angelhack.com/", logo: 'https://pbs.twimg.com/profile_images/659772478231699456/q5NkdUiU.jpg', address: '1459 18th Street PMB#192 San Francisco CA, 94107', description: "AngelHack ignites the passion of the world's most vibrant community of code creators + change makers to invent the new and make change happen, together.")
# School.create(name: 'Code Core', webpage:"http://codecore.ca/", logo: 'https://pbs.twimg.com/profile_images/378800000407550507/cc18ca42b18803f6c8c3dbf09b28a60b.jpeg', address: '142 W Hastings St. // Vancouver, BC // Canada //', description: "Training the programmers of tomorrow in hands-on intensive programs taught by industry professionals. PCTIA Accredited.")
# School.create(name: 'Coder Camps', webpage:"https://www.codercamps.com/home/index", logo: 'https://pbs.twimg.com/profile_images/378800000139847457/71de3a478d6b7d85b173f7d3e71adf89.png', address: '11200 Broadway Street Suite 2731 Pearland, TX 77584', description: "9-12 Week Development Boot camps • Full Stack .NET or JS • Learn In a Live Production Setting • New Cycles Begin Every 6 Weeks")
# School.create(name: 'Coder Vox', webpage:"http://codervox.com/", logo: 'https://pbs.twimg.com/profile_images/471125756416757760/iDwOpjp4.png', address: 'Austin, TX', description: "Coder Vox is a Software Education Startup specializing in the promotion and advancement of programming knowledge through high-quality online video tutorials.")
# School.create(name: 'Fire Boot Camp', webpage:"http://firebootcamp.com", logo: 'https://pbs.twimg.com/profile_images/420608140619431936/BB9NLLfh.png', address: 'San Francisco | Sydney | Melbourne', description: "Become a world class .NET developer in 9 weeks.")

School.destroy_all

# user1.reviews.build(title: "Successful", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating: "5 stars", school_id:school1.id)
# user2.reviews.build(title: "Stop reading and apply to Hack Reactor right now", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating: "5 stars", school_id:school2.id)
# user3.reviews.build(title: "BEST school. Dive in", description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating:"5 stars", school_id:school3.id)
# user4.reviews.build(title: "It's ok", description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating:"3 stars", school_id:school4.id)


url = "https://www.switchup.org/coding-bootcamps-reviews?location=27"
doc = Nokogiri::HTML(open(url))
doc.css(".thumbnail-info").each do |main|
  
  schoolname = main.at_css('.topic-title a').text
  address = main.at_css('.topic-location').text

  description = main.at_css('.topic-summary').text unless main.at_css('.topic-summary').nil?
  #puts schoolname.text, "\n", address.text
   #binding.pry
  School.create({name: schoolname, address: address, description: description, logo:'https://pbs.twimg.com/profile_images/420608140619431936/BB9NLLfh.png',webpage:'www.galvanize.com'})
end



