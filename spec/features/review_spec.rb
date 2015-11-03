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
      click_button
      within "form" do
        fill_in "review_title", with: "My First Review"
        fill_in "review_description", with: "This school is great"
        fill_in "review_rating", with: "5 stars"
      end
      click_button "Create Review"
      expect(page).to have_content "Successfully Created"
      expect(page.current_path).to eq school_path(school)
      expect(page).to have_content "My First Review"
    end

    scenario "creating a new review without all required fields" do
      visit new_user_review_path(user)
      within "form" do
        fill_in "review_title", with: ""
      end
      click_button "Create Review"
      expect(page).to have_content "can't be blank"
    end
end


feature "update an existing review" do
  user1 = User.create(username: "maja",password: "secret", email:"maja@gmail.com")
  s = School.create(name: 'Galvanize', webpage: "www.galvanize.com",logo: 'logo', address: '44 Tehama St, San Francisco, CA 94105', description: "Galvanize Full Stack is a 24-week program that teaches you how to make an impact as a contributing member of a development team. The program culminates in hiring day, where students meet potential employers, present projects, and show off everything they’ve learned.")
  user1.reviews.build(title: "Successful", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating: "5 stars", school_id:s.id)

  scenario "sucessfully updating" do
      visit edit_review_path(review)
      within "form" do
        fill_in "review_title", with: "Updated Review"
        fill_in "review_description", with: "Just kidding, it was AWESOME"
      end
      click_button "Update Review"
      expect(page).to have_content "Updated"
      user1.reload
      expect(user1.reviews.title).to eq "Updated Review"
      expect(user1.reviews.description).to eq "Just kidding, it was AWESOME"
      expect(page.current_path).to eq school_path(s)
  end

  scenario "Update fail" do
      visit edit_review_path(review)
      within "form" do
        fill_in "review_title", with: ""
      end
      click_button "Update Review"
      expect(page).to have_content "can't be blank"
  end
end

feature "delete a existing review" do

  background do
    user1 = User.create(username: "maja",password: "secret", email:"maja@gmail.com")
    s = School.create(name: 'Galvanize', webpage: "www.galvanize.com",logo: 'logo', address: '44 Tehama St, San Francisco, CA 94105', description: "Galvanize Full Stack is a 24-week program that teaches you how to make an impact as a contributing member of a development team. The program culminates in hiring day, where students meet potential employers, present projects, and show off everything they’ve learned.")
    user1.reviews.build(title: "Successful", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating: "5 stars", school_id:s.id)
  end

  scenario "sucessfully deleting" do
    visit login_path
      within "form" do
          fill_in 'username', :with => user1[:username]
          fill_in 'password', :with => user1[:password]
      end
      click_button "Log in"       
      expect(page).to have_content "My profile"
      expect(page.current_path).to eq home_path
    visit user_reviews_path(user1)
    click_link "Delete this Review"
    expect(page).to have_content "Deleted"
    expect(Review.all.size).to eq 0
  end
end
