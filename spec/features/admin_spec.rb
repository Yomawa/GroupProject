# require 'rails_helper'

# # ADMIN

# feature "delete a existing Review as Admin" do
#    let(:user){User.create(email: 'test@test.com', username: 'test', password: 'password', is_admin: true)}
#    background do
#       user.reviews.create(title:"Cool Experience", description: 'would do it again', rating: "4")
#       School.create(name: 'Galvanize', webpage:"www.galvanize.com", logo: 'logo', address: '44 Tehama St, San Francisco, CA 94105', description: "Galvanize Full Stack is a 24-week program that teaches you how to make an impact as a contributing member of a development team. The program culminates in hiring day, where students meet potential employers, present projects, and show off everything they’ve learned.")
#       visit login_path
#         within "form" do
#             fill_in 'Username', :with => user.username
#             fill_in 'Password', :with => user.password
#         end
#         click_button "Log in"      
#         click_link "Admin tools"
#     end

#   xscenario "sucessfully deleting Review" do
#       expect(page).to have_content "Cool Experience"
#       click_link "Delete this Review"
#       expect(page).to have_content "Deleted"
#       expect(Review.all.size).to eq 0
#     end

#   scenario "sucessfully deleting School" do
#       expect(page).to have_content "Galvanize"
#       click_link "Delete School"
#       expect(page).to have_content "Deleted"
#       expect(School.all.size).to eq 0
#     end

#   scenario "sucessfully deleting User" do
#       expect(page).to have_content "test"
#       click_link "Delete User"
#       expect(page).to have_content "Deleted"
#       expect(User.all.size).to eq 0
#     end
# end





