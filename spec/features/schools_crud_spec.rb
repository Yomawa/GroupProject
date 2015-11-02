require 'rails_helper'
feature "create a new school" do
  background do
    visit new_school_path
  end

  scenario "creating a new school with all required fields" do
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
    within "form" do
      fill_in "Name", with: "Galvanize"
      fill_in "webpage", with: "www.galvanize.com"
      fill_in "logo", with: "img"
      fill_in "address", with: "44 Tehama St, San Francisco, CA 94105"
      fill_in "description", with: "We believe in making education and growth accessible to anyone – especially underrepresented groups in the tech industry. Whether you’re a founder, student, or just someone who wants to level up their career, we want Galvanize to be a welcoming, inclusive place where you can take the next step in your journey."
    end
    click_button "Create School"
    expect(page).to have_content "Name can't be blank webpage can't be blank logo can't be blank address can't be blank description can't be blank"
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
      fill_in "description", with: "We believe in making education and growth accessible to anyone – especially underrepresented groups in the tech industry. Whether you’re a founder, student, or just someone who wants to level up their career, we want Galvanize to be a welcoming, inclusive place where you can take the next step in your journey."
    end
    click_button "Update School"
    school.reload
    expect(page).to have_content "Updated"
    expect(school.name).to eq "Galvanize"
    expect(school.webpage).to eq "www.galvanize.com"
    expect(school.logo).to eq "logo.png"
    expect(school.address).to eq "44 Tehama St, San Francisco, CA 94105"
    expect(school.description).to eq "We believe in making education and growth accessible to anyone – especially underrepresented groups in the tech industry. Whether you’re a founder, student, or just someone who wants to level up their career, we want Galvanize to be a welcoming, inclusive place where you can take the next step in your journey."
  end
    scenario "Failed update" do
      ######write later
  end
end

feature "delete a existing school" do
  scenario "sucessfully deleting" do
    s = School.create(name:"Galvanize",webpage:"www.galvanize.com",logo:"logo.png",address:"44 Tehama St, San Francisco, CA 94105",description:"We believe in making education and growth accessible to anyone – especially underrepresented groups in the tech industry. Whether you’re a founder, student, or just someone who wants to level up their career, we want Galvanize to be a welcoming, inclusive place where you can take the next step in your journey.")
    #check this line? not sure 
    s.reviews.create(title: "test", description: "test", rating: "5stars")
    #do we need to specifay a user???
    visit schools_path
    click_link "Delete this school"
    expect(page).to have_content "Deleted"
    expect(School.all.size).to eq 0
    expect(s.reviews.size).to eq 0
  end
end

