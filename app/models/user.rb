class User < ActiveRecord::Base

    has_secure_password

    validates_presence_of :first_name, 
    :last_name,
    :password,
    :password_confirmation,
    :email

    validates :password, length: { minimum: 5}
    validates :email, uniqueness: {:case_sensitive => false}

    def self.authenticate_with_credentials(email, password)
        user = User.find_by(email: email.downcase.strip).authenticate(password)
        if (user)
            user
        else 
            nil
        end
    end

end
