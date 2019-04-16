class User < ApplicationRecord
  has_many :subscriptions
  has_many :past_payments
  has_many :bank_details
  has_many :card_details
  has_many :paypal_details
  has_secure_password
    validates :first_name, presence: true 
    validates :last_name, presence: true 
    validates :email, presence: true, uniqueness:true

    

    # def password=(password)
    #   hashed_pw = BCrypt::Password.create(password).to_s
    #   self.password_digest = hashed_pw
    # end
  
    # def authenticate(password)
    #   pw_object = BCrypt::Password.new(self.password_digest)
  
    #   pw_object == password
    # end

end
