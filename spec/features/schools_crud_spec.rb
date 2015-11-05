require 'rails_helper'
feature "create a new school" do


  scenario "creating a new school with all required fields" do
    visit new_school_path
    within "form" do
      fill_in "school_name", :with => "Galvanize"
      fill_in "school_webpage", :with => "www.galvanize.com"
      fill_in "school_logo", :with => "img"
      fill_in "school_address", :with => "44 Tehama St, San Francisco, CA 94105"
      fill_in "school_description", :with => "We believe"
    end
    click_button "Create School"
    #binding.pry
    expect(page).to have_content "Successfully Created"
    expect(page.current_path).to eq schools_path
  end

  scenario "creating a new school blank fields" do
    visit new_school_path
    within "form" do
      fill_in "school_name", :with => ""
      fill_in "school_webpage", :with => ""
      fill_in "school_logo", :with => ""
      fill_in "school_address", :with => ""
      fill_in "school_description", :with => ""
    end
    click_button "Create School"
    expect(page).to have_content "can't be blank"
  end
end

# feature "update an existing school" do
#     #save_and_open_page
#   let(:school){School.create(name:"test",webpage:"user",logo:"test.png",address:"test",description:"test")}
#   scenario "sucessfully updating" do
#     visit edit_school_path(school)
#     within "form" do
#       fill_in "school_name", with: "Galvanize"
#       fill_in "school_webpage", with: "www.galvanize.com"
#       fill_in "school_logo", with: "logo.png"
#       fill_in "school_address", with: "44 Tehama St, San Francisco, CA 94105"
#       fill_in "school_description", with: "We believe in making education and ."
#     end
#     click_button "Update School"
#     school.reload
#     expect(page).to have_content "Updated"
#     expect(school.name).to eq "Galvanize"
#     expect(school.webpage).to eq "www.galvanize.com"
#     expect(school.logo).to eq "logo.png"
#     expect(school.address).to eq "44 Tehama St, San Francisco, CA 94105"
#     expect(school.description).to eq "We believe in making education and ."
#     expect(page.current_path).to eq schools_path(school)
#   end

#   scenario "without all required fields" do
#     visit edit_school_path(school)
#     within "form" do
#       fill_in "school_name", with: ""
#       fill_in "school_webpage", with: ""
#       fill_in "school_logo", with: ""
#       fill_in "school_address", with: ""
#       fill_in "school_description", with: ""
#     end
#     click_button "Update School"
#     expect(page).to have_content "can't be blank"
#     expect(page.current_path).to eq school_path(school)
#     end
# end

# feature "delete an existing school with all schools reviews" do
#   scenario "sucessfully deleting" do

#     user1 = User.create(username: "maja",password: "secret", email:"maja@gmail.com")
#     s = School.create(name: 'Galvanize', webpage: "www.galvanize.com",logo: 'logo', address: '44 Tehama St, San Francisco, CA 94105', description: "Galvanize Full Stack is a 24-week program that teaches you how to make an impact as a contributing member of a development team. The program culminates in hiring day, where students meet potential employers, present projects, and show off everything they’ve learned.")
#     #s.reviews.create(title: "Successful", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating: "5 stars", user_id:user1.id)
#     user1.reviews.build(title: "Successful", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating: "5 stars", school_id:s.id)

#     visit school_path(s)
#     click_link "Delete"
#     expect(page).to have_content "Deleted"
#     expect(School.all.size).to eq 0
#     expect(s.reviews.size).to eq 0
#     expect(page.current_path).to eq schools_path
#   end
# end

