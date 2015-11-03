# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.crease([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#CONTENT = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore"
User.delete_all
School.delete_all
Reviews.delete_all

User.create(username: "admin", password: "admin", is_admin: true)
user1 = User.create(username: "maja",password: "secret", email:"maja@gmail.com")
user2 = User.create(username: "jane",password: "jane1", email:"jane@gmail.com")
user3 = User.create(username: "miguel",password: "miguel1", email:"miguel@gmail.com")
user4 = User.create(username: "team",password: "team1", email:"team@gmail.com")




school1 = School.create(name: 'Galvanize', webpage:"www.galvanize.com", logo: 'logo', address: '44 Tehama St, San Francisco, CA 94105', description: "Galvanize Full Stack is a 24-week program that teaches you how to make an impact as a contributing member of a development team. The program culminates in hiring day, where students meet potential employers, present projects, and show off everything they’ve learned.")
school2 = School.create(name: 'Hack Reactor', webpage:"www.hackreactor.com", logo: 'logo', address: '944 Market St., San Francisco, CA 94103', description: "Founded in 2012 by Anthony Phillips and Douglas Calhoun (formerly Catalyst), Hack Reactor is a 12-week software engineering course that promises to teach students how to think like engineers and build production-grade web applications. The program emphasizes project-based learning, hack/pair programming, and industry tools like Git, Backbone, Rails, Unix, and TDD testing frameworks. Hack Reactor is self-admittedly not a '0 to 60' course, it is instead a '20 to 120' course and expects successful applicants to have written some code independently or through online e-learning platforms. Hack Reactor is looking for students who exemplify the following: passionate, intelligent learners; clear, empathetic communicators; and dedicated, curious coders. The program is designed with students' job searches in mind and promises graduates will leave with a strong Github presence, tons of technical interview experience, a personal website, updated resume, and LinkedIn profile. Hack Reactor boasts a 98% graduate hiring rate placing alumni in web development positions at companies like Adobe, Groupon, and SalesForce.")
school3 = School.create(name: 'General Assembly', webpage:"www.generalassemly.com", logo: 'logo', address: '414 Brannan Street, San Francisco, CA 94107', description: "General Assembly aims to create a global community of individuals empowered to pursue work they love, by offering full-time immersive programs, long-form courses, and classes and workshops on the most relevant skills of the 21st century – from web development and user experience design, to business fundamentals, to data science, to product management and digital marketing. Established in early 2011 as an innovative community in New York City for entrepreneurs and startup companies, General Assembly is an educational institution that transforms thinkers into creators through education in technology, business and design at nine campuses across four continents.")
school4 = School.create(name: 'App Academy', webpage:"www.appacademy.com", logo: 'logo', address: '160 Folsom St, San Francisco, CA 94105', description: "Founded in 2012 by Ned Ruggeri and Kush Patel, App Academy is an immersive 12-week Ruby-focused web development course with campuses in San Francisco and New York City. Students interested in this intense program should expect to put in 90-100 hours per week. Upon graduation, students will have a portfolio of real world projects to show to prospective employers.")


user1.reviews.build(title: "Successful", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating: "5 stars", school_id:school1.id)
user2.reviews.build(title: "Stop reading and apply to Hack Reactor right now", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating: "5 stars", school_id:school2.id)
user3.reviews.build(title: "BEST school. Dive in", description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating:"5 stars", school_id:school3.id)
user4.reviews.build(title: "It's ok", description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating:"3 stars", school_id:school4.id)




