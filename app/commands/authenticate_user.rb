class AuthenticateUser
  prepend SimpleCommand

  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :username, :password

  def user
    user = User.find_by_username(username)
    return user if user&.authenticate(password)

    errors.add :user_authentication, 'Incorrect login or(and) password'
    nil
  end
end
