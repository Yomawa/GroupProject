require 'rails_helper'
#CRUD ON REVIEW: 
feature "CRUD on reviews AS USER" do

  let(:user){User.create(email: 'test@test.com', username: 'test', password: 'password')}
  let(:school){School.create(name: 'new thing', webpage: "www.galvanize.com",logo: 'logo', address: '44 Tehama St, San Francisco, CA 94105', description: "Galvanize Full Stack is a 24-week program that teaches you how to make an impact as a contributing member of a development team. The program culminates in hiring day, where students meet potential employers, present projects, and show off everything they’ve learned.")}

    scenario "creating a new review with all required fields" do
      visit login_path
      within "form" do
          fill_in 'username', :with => user.username
          fill_in 'password', :with => user.password
      end
      click_button "Log in"       
      expect(page).to have_content "My profile"
      expect(page.current_path).to eq root_path
      visit school_path(school)
      click_link "New Review"
      within "form" do
        fill_in "Title", with: "My First Review"
        fill_in "Description", with: "This school is great"
        fill_in "Rating", with: "5 stars"
      end
      click_button "Create Review"
      expect(page).to have_content "Successfully Created"
      expect(page.current_path).to eq school_path(school)
      expect(page).to have_content "My First Review"
    end

    scenario "creating a new review without all required fields" do
      visit login_path
      within "form" do
          fill_in 'username', :with => user.username
          fill_in 'password', :with => user.password
      end
      click_button "Log in"       
      expect(page).to have_content "My profile"
      expect(page.current_path).to eq root_path
      visit school_path(school)
      click_link "New Review"
      within "form" do
        fill_in "Title", with: ""
      end
      click_button "Create Review"
      expect(page).to have_content "can't be blank"
    end
end


# feature "Modifying Existing Review" do
#   let(:user1){User.create(username: "usery",password: "secret", email:"usery@gmail.com")} 
#     let(:school1){School.create(name: 'school 1', webpage: "www.galvanize.com",logo: 'logo', address: '44 Tehama St, San Francisco, CA 94105', description: "Galvanize Full Stack is a 24-week program that teaches you how to make an impact as a contributing member of a development team. The program culminates in hiring day, where students meet potential employers, present projects, and show off everything they’ve learned.")}
#     let(:review1){user1.reviews.build(title: "Successful new", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating: "5 stars", school_id:school1.id)}

#   scenario "sucessfully updating" do
#     visit login_path
#       within "form" do
#           fill_in 'username', :with => user1.username
#           fill_in 'password', :with => user1.password
#       end
#       click_button "Log in"       
#       expect(page).to have_content "My profile"
#       expect(page.current_path).to eq root_path
#       review1.save
#       click_link "My profile"
#       within "div#"+review1.id.to_s do
#         click_link "Edit"
#       end 
#       within "form" do
#         fill_in "Title", with: "Updated Review"
#         fill_in "Description", with: "Just kidding, it was AWESOME"
#         fill_in "Rating", with: "3 stars"
#       end
#       click_button "Update Review"
#       expect(page).to have_content "Updated"
#       review1.reload
#       expect(review1.title).to eq "Updated Review"
#       expect(review1.description).to eq "Just kidding, it was AWESOME"
#       expect(page.current_path).to eq school_path(school1)
#   end

#   scenario "Update fail" do
#     visit login_path
#       within "form" do
#           fill_in 'username', :with => user1.username
#           fill_in 'password', :with => user1.password
#       end
#       click_button "Log in"       
#       expect(page).to have_content "My profile"
#       expect(page.current_path).to eq root_path
#       review1.save 
#       click_link "My profile"
#       within "div#"+review1.id.to_s do
#         click_link "Edit"
#       end
#       within "form" do
#         fill_in "review_title", with: ""
#       end
#       click_button "Update Review"
#       expect(page).to have_content "can't be blank"
#   end
  # scenario "Delete a review" do
  #   visit login_path
  #     within "form" do
  #         fill_in 'username', :with => user1.username
  #         fill_in 'password', :with => user1.password
  #     end
  #     click_button "Log in"       
  #     expect(page).to have_content "My profile"
  #     expect(page.current_path).to eq root_path
  #     review1.save 
  #     click_link "My profile"
  #     within "div#"+review1.id.to_s do
  #       click_button "Delete"
  #     end
  #     save_and_open_page
  #     expect(page).not_to have_content review1.title
  #   end
# end
