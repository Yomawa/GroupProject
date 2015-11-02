require 'rails_helper'
 
feature "Signing up" do

    background do
        User.create(email: "miguel@miguel.com",
                            username: "miguel", 
                            password:"secret",
                            picture:"some url",
                            bio: "some description",
                            contact_link: "some link")
    end

    scenario "signing up with some field blank" do
        visit signup_path
        click_button "Signup"
        expect(page).to have_content "can't be blank"
        expect(page.current_path).to eq signup_path
    end

    scenario "signing up with a email that has been taken" do
        visit signup_path
        within "form" do
            fill_in 'user_email', :with => "miguel@miguel.com"
            fill_in 'user_username', :with => 'angel'
            fill_in 'user_password', :with => 'password'
            fill_in 'user_picture', :with => 'something'
            fill_in 'user_bio', :with => 'something'
            fill_in 'user_contact_link', :with => 'link'
        end
        click_button "Signup"
        expect(page).to have_content 'Email has already been taken'
        expect(page.current_path).to eq signup_path
    end

    scenario "signing up with a username that has been taken" do
        visit signup_path
        within "form" do
            fill_in 'user_email', :with => 'angel@angel.com'
            fill_in 'user_username', :with => 'miguel'
            fill_in 'user_password', :with => 'password'
            fill_in 'user_picture', :with => 'something'
            fill_in 'user_bio', :with => 'something'
            fill_in 'user_contact_link', :with => 'link'
        end
        click_button "Signup"
        expect(page).to have_content 'Username has already been taken'
        expect(page.current_path).to eq signup_path
    end

    scenario "signing in ok" do
        visit signup_path
        within "form" do
            fill_in 'user_email', :with => 'angel@angel.com'
            fill_in 'user_username', :with => 'angel'
            fill_in 'user_password', :with => 'secret'
            fill_in 'user_picture', :with => 'something'
            fill_in 'user_bio', :with => 'something'
            fill_in 'user_contact_link', :with => 'link'
        end
        click_button "Signup"
        expect(page).to have_content 'Welcome, you are now logged in!'
        expect(page.current_path).to eq root_path
    end
end

