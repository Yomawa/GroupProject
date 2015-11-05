require 'rails_helper'
feature "CRUD on reviews AS USER" do
  let(:user1){User.create(username: "usery",password: "secret", email:"usery@gmail.com")} 
  let(:school1){School.create(name: 'school 1', webpage: "www.galvanize.com",logo: 'logo', address: '44 Tehama St, San Francisco, CA 94105', description: "Galvanize Full Stack is a 24-week program that teaches you how to make an impact as a contributing member of a development team. The program culminates in hiring day, where students meet potential employers, present projects, and show off everything they’ve learned.")}
  let(:review1){user1.reviews.build(title: "Successful new", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating: "5 stars", school_id:school1.id)}
  
  scenario "sucessfully deleting" do
    visit login_path
      within "form" do
          fill_in 'username', :with => user1.username
          fill_in 'password', :with => user1.password
      end
      click_button "Log in"       
      expect(page).to have_content "My profile"
      expect(page.current_path).to eq root_path
      review1.save 
      click_link "My profile"
      within "div#"+review1.id.to_s do
        click_button "Delete"
      end
      # save_and_open_page
      # expect(page).not_to have_content "Successful new"
      # expect(Review.all.size).to eq 0
  end

end