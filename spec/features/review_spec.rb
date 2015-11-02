#CRUD ON REVIEW: 
feature "CRUD on reviews AS USER" do
  let(:user){User.create(email: 'test@test.com', username: 'test', password: 'password', is_admin: false)}
  let(:school){School.create(name: 'Galvanize')}
    
    background do
      visit new_school_review_path(school)
    end
    scenario "creating a new review with all required fields" do
      within "form" do
        fill_in "Title", with: "My First Review"
        fill_in "Description", with: "This school is great"
        # FILL OUT RATING SYSTEM
      end
      click_button "Create Review"
      expect(page).to have_content "Successfully Created"
      expect(page.current_path).to eq school_reviews_path
      expect(page).to have_content "My First Review"
      
    end
    scenario "creating a new review without all required fields" do
      within "form" do
        fill_in "Title", with: ""
        fill_in "Description", with: ""
        # FILL OUT RATING SYSTEM
      end
      click_button "Create Review"
      expect(page).to have_content "Title can't be blank"
      # ADD OTHER ERROR MESSAGES
    end
  end
feature "update an existing review" do
    let(:review){school.reviews.create(title:"Second Review", description: "Not Great.")}
    scenario "sucessfully updating" do
      visit edit_review_path(review)
      within "form" do
        fill_in "Title", with: "Updated Review"
        fill_in "Description", with: "Just kidding, it was AWESOME"
      end
      click_button "Update Review"
      expect(page).to have_content "Updated"
      assessment.reload
      expect(assessment.title).to eq "Updated Review"
      expect(page.current_path).to eq school_reviews_path(review.school)
      expect(assessment.description).to eq "Just kidding, it was AWESOME"
    end
  end
# ADD UNSUCCESSFUL UPDATE
  feature "delete a existing review" do
    background do
      # create user. 
      user.reviews.create(title:"Cool Experience", description: 'would do it again')
    end
    scenario "sucessfully deleting" do
      # visit login_page AND OTHER STUFF. SEE TITANTIC APP
      visit user_reviews_path(user)
      click_link "Delete this Review"
      expect(page).to have_content "Deleted"
      expect(Assessment.all.size).to eq 0
    end
  end
# DELETING REVIEW AS ADMIN
feature "delete a existing assessment as Admin" do
    background do
      user.reviews.create(title:"Cool Experience", description: 'would do it again')
      visit new_school_review_path(school)
    end
    scenario "sucessfully deleting" do
      visit #ADMIN ROUTE AND LOGIN AND ALL THE STUFF
      click_link "Delete this Review"
      expect(page).to have_content "Deleted"
      expect(Assessment.all.size).to eq 0
    end
  end
