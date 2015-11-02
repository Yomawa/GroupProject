require 'rails_helper'

feature 'Login and logout' do

    background do
        User.create(email: "miguel@miguel.com",
                            username: "miguel", 
                            password:"secret",
                            picture:"some url",
                            bio: "some description",
                            contact_link: "some link")
    end

    scenario "logging in without username and password in the textbox" do
        visit login_path
        click_button "Log in"       
        expect(page).to have_content "User or password can't be blank"
        expect(page.current_path).to eq login_path
    end

    scenario "logging in with incorrect username" do
        visit login_path
        within "form" do
            fill_in 'username', :with => 'wrong'
            fill_in 'password', :with => 'secret'
        end
        click_button "Log in"       
        expect(page).to have_content "Your user it's not correct!"
        expect(page.current_path).to eq login_path
    end

    scenario "logging in with incorrect password" do
        visit login_path
        within "form" do
            fill_in 'username', :with => 'miguel'
            fill_in 'password', :with => 'wrong'
        end
        click_button "Log in"       
        expect(page).to have_content "Your password it's not correct!"
        expect(page.current_path).to eq login_path
    end

    scenario "logging in with the correct username and password" do
        # User.create(username: "miguel", password: "secret")
        visit login_path
        within "form" do
            fill_in 'username', :with => 'miguel'
            fill_in 'password', :with => 'secret'
        end
        click_button "Log in"       
        expect(page).to have_content "My profile"
        expect(page.current_path).to eq root_path
    end

    scenario "logging out" do
        visit login_path
        within "form" do
            fill_in 'username', :with => 'miguel'
            fill_in 'password', :with => 'secret'
        end
        click_button "Log in"       
        expect(page).to have_content "My profile"
        expect(page.current_path).to eq root_path
        visit root_path
        click_link "Log out"
        expect(page).to have_content "You are now log out"
        expect(page.current_path).to eq root_path
    end
end
