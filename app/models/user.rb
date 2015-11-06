class User < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    has_many :reviews, dependent: :destroy

    def generate_password_reset_token!
      update(reset_token: SecureRandom.urlsafe_base64(48))
    end

    def reset_password!(new_password)
    self.password = new_password
    save!
    end
end


