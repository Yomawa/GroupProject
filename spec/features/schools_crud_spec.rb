require 'rails_helper'
feature "create a new school" do
  scenario "creating a new school with all required fields" do
    visit new_school_path
    within "form" do
      fill_in "Name", with: "Galvanize"
      fill_in "webpage", with: "www.galvanize.com"
      fill_in "logo", with: "img"
      fill_in "address", with: "44 Tehama St, San Francisco, CA 94105"
      fill_in "description", with: "We believe in making education and."
    end
    click_button "Create School"
    expect(page).to have_content "Successfully Created"
    expect(page).to have_content "Galvanize"
    expect(page.current_path).to eq schools_path
  end

  scenario "creating a new school without all required fields" do
    visit new_school_path
    within "form" do
      fill_in "Name", with: "Galvanize"
      fill_in "webpage", with: ""
      fill_in "logo", with: "img"
      fill_in "address", with: "44 Tehama St, San Francisco, CA 94105"
      fill_in "description", with: "We believe in making education and ."
    end
    click_button "Create School"
    expect(page).to have_content "can't be blank"
    expect(page.current_path).to eq new_school_path
  end
end

feature "update an existing school" do
  let(:school){School.create(name:"test",webpage:"user", logo:"test.png", address:"test", description:"test")}
  scenario "sucessfully updating" do
    visit edit_school_path(school)
    within "form" do
      fill_in "Name", with: "Galvanize"
      fill_in "webpage", with: "www.galvanize.com"
      fill_in "logo", with: "logo.png"
      fill_in "address", with: "44 Tehama St, San Francisco, CA 94105"
      fill_in "description", with: "We believe in making education and ."
    end
    click_button "Update School"
    school.reload
    expect(page).to have_content "Updated"
    expect(school.name).to eq "Galvanize"
    expect(school.webpage).to eq "www.galvanize.com"
    expect(school.logo).to eq "logo.png"
    expect(school.address).to eq "44 Tehama St, San Francisco, CA 94105"
    expect(school.description).to eq "We believe in making education and ."
    expect(page.current_path).to eq schools_path
  end


  scenario "updeting a school without all required fields" do
    within "form" do
    fill_in "Name", with: "Galvanize"
    fill_in "webpage", with: "www.galvanize.com"
    fill_in "logo", with: ""
    fill_in "address", with: "44 Tehama St, San Francisco, CA 94105"
    fill_in "description", with: "We believe in making education and ."
  end
  click_button "Update School"
  expect(page).to have_content "can't be blank"
  expect(page.current_path).to eq edit_school_path(school)
  end
end

feature "delete an existing school with all schools reviews" do
  scenario "sucessfully deleting" do
    user1 = User.create(username: "maja",password: "secret", email:"maja@gmail.com")
    School.create(name: 'Galvanize', logo: 'logo', address: '44 Tehama St, San Francisco, CA 94105', description: "Galvanize Full Stack is a 24-week program that teaches you how to make an impact as a contributing member of a development team. The program culminates in hiring day, where students meet potential employers, present projects, and show off everything they’ve learned.")
    user1.reviews.build(title: "Successful", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, sit! Qui repellendus reprehenderit ea, voluptas ullam assumenda quam atque quidem. Earum consectetur illo officia numquam voluptate officiis sed? Sint, nemo!", rating: "5 stars", school_id:1)
    visit schools_path
    click_link "Delete this school"
    expect(page).to have_content "Deleted"
    expect(School.all.size).to eq 0
    expect(s.reviews.size).to eq 0
  end
end

