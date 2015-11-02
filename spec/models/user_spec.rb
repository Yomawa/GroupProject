require 'rails_helper'

  describe User do

  let(:user) { User.create(email: "miguel@miguel.com",
                            username: "miguel", 
                            password:"secret",
                            picture:"some url",
                            bio: "some description",
                            contact_link: "some link") }

  it 'admin should be false' do
    expect(user.is_admin).to be false
  end

  it{is_expected.to have_secure_password}

  it{is_expected.to validate_presence_of :username}
  it{is_expected.to validate_presence_of :email}

  it{is_expected.to validate_uniqueness_of :username}
  it{is_expected.to validate_uniqueness_of :email}

  it{is_expected.to have_many(:reviews).dependent(:destroy)}

  [:username, :password, :email, :password_digest, :picture, :bio, :contact_link, :reset_token, :is_admin].each do |prop|
  it {is_expected.to respond_to prop}
  end
end
