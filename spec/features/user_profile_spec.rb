require 'rails_helper'
feature "CRUD on reviews AS USER" do

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
      ### CREATE
    click_link "Delete this Review"
    expect(page).to have_content "Deleted"
    expect(Review.all.size).to eq 0
  end

end