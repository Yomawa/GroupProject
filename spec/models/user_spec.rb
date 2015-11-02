require 'rails_helper'

  describe User do
  #subject(:user){User.create(username:"Maja", password:"secret")}
  it{is_expected.to have_secure_password}
  it{is_expected.to validate_presence_of :username}
  it{is_expected.to validate_presence_of :email}
  it{is_expected.to validate_uniqueness_of :username}
  it{is_expected.to validate_uniqueness_of :email}
  it{is_expected.to have_many(:reviews)}
  #check to see if this is correct?
  #it{is_expected.to respond_to(:is_admin?) }
  #it { is_expected.to respond_to(:private_token) }
  #it { expect(user.is_admin?).to be_falsey }
  #it {is_expected.to respond_to :is_admin eq :nil}
  # describe 'authentication token' do
  #   it "should have authentication token" do
  #     user = create(:user)
  #     expect(user.authentication_token).not_to be_blank
  #   end
  # end

  [:username, :password, :email, :password_digest, :picture, :bio, :contact_link, :private_token, :is_admin].each do |prop|
  it {is_expected.to respond_to prop}
  end
end
