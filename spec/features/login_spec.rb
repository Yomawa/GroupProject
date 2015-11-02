require 'rails_helper'

feature 'Login and logout' do

    let(:user) { User.create(username: "miguel", password:"secret") }

    scenario "logging in without username and password in the textbox" do
        visit login_path
        within "form" do
            fill_in 'username', :with => ''
            fill_in 'password', :with => ''
        end
        click_button "Log in"       
        expect(page).to have_content "Your user it's not correct!"
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
        expect(page).to have_content "welcome"
        expect(page.current_path).to eq home_path
    end

    scenario "logging out" do
        visit home_path
        click_button "Log out"
        expect(page).to have_content "You are now log out"
        expect(page.current_path).to eq home_path
    end
end
