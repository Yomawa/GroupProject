require "rails_helper"

feature "Forgotten passwords" do
  let(:user){ User.create(username:"JoeShmoe", email:"joe@shmoe.com", password:"testing") }

  before {visit login_path}

  scenario "sends forgot password email" do
    click_link "Forgot your password?"
    fill_in "Email", with: user.email
    click_button "Reset Password"
    expect {ActionMailer::Base.deliveries.count.to eq(1)}
  end

  scenario "resets password when following the email link" do
    click_link "Forgot your password?"
    fill_in "Email", with: user.email
    click_button "Reset Password"
    open_email(user.email)
    current_email.click_link "here"
    expect(page).to have_content("Change Your Password")

   
    fill_in "Password", with: "newpassword1"
    click_button "Reset Password"
    expect(page).to have_content("Password updated.")
    expect(page.current_path).to eq(users_path)

    click_link "Logout"
    expect(page).to have_content("Logged out")
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: "newpassword1"
    click_button "Log In"
    expect(page).to have_content("Welcome")
  end
end