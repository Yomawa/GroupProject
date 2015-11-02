require 'rails_helper'

feature "Manage of protected routes" do

    scenario "User try to create new review without logging" do
        # Not sure of the route
        visit new_review_path
        expect(page).to have_content "Login First"
        expect(page.current_path).to eq login_path
    end

    scenario "logging if the user are already logged in" do
        User.create(username: "angel", password: "angel")
        visit login_path
        within "form" do
            fill_in 'username', :with => 'angel'
            fill_in 'password', :with => 'angel'
        end
        click_button "Log in"       
        expect(page).to have_content "welcome"
        expect(page.current_path).to eq home_path
        visit login_path
        expect(page.current_path).to eq home_path
    end

    scenario "signing if the user are already logged in" do
        visit signup_path
        User.create(username: "angel", password: "angel")
        visit login_path
        within "form" do
            fill_in 'username', :with => 'angel'
            fill_in 'password', :with => 'angel'
        end
        click_button "Log in"       
        expect(page).to have_content "welcome"
        expect(page.current_path).to eq home_path
        visit signup_path
        expect(page.current_path).to eq home_path
    end
end
