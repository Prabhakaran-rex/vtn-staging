module Devise
  module Models

    # Recoverable takes care of resetting the user password and send reset instructions.
    #
    # ==Options
    #
    # Recoverable adds the following options to devise_for:
    #
    #   * +reset_password_keys+: the keys you want to use when recovering the password for an account
    #
    # == Examples
    #
    #   # resets the user password and save the record, true if valid passwords are given, otherwise false
    #   User.find(1).reset_password!('password123', 'password123')
    #
    #   # only resets the user password, without saving the record
    #   user = User.find(1)
    #   user.reset_password('password123', 'password123')
    #
    #   # creates a new token and send it with instructions about how to reset the password
    #   User.find(1).send_reset_password_instructions
    #
    module Recoverable

      module ClassMethods
        

        # Attempt to find a user by its reset_password_token to reset its
        # password. If a user is found and token is still valid, reset its password and automatically
        # try saving the record. If not user is found, returns a new user
        # containing an error in reset_password_token attribute.
        # Attributes must contain reset_password_token, password and confirmation
        def reset_password_by_token(attributes={})
          original_token       = attributes[:reset_password_token]
          reset_password_token = Devise.token_generator.digest(self, :reset_password_token, original_token)

          recoverable = find_or_initialize_with_error_by(:reset_password_token, reset_password_token)
          if recoverable.persisted?
            if recoverable.reset_password_period_valid?
              recoverable.reset_password!(attributes[:password], attributes[:password_confirmation])
            else
              recoverable.errors.add(:reset_password_token, :expired)
            end
          end

          recoverable.reset_password_token = original_token
          recoverable
        end

        Devise::Models.config(self, :reset_password_keys, :reset_password_within)
      end
    end
  end
end