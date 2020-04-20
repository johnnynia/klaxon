class UserMailer < ApplicationMailer
  layout 'user_mailer'

  def login_email(user: nil)
    token = LoginToken.create(user: user)
    @url = token_session_url(token: token)
    @user = user

    maily = mail(to: @user.email, subject: 'Log in to Klaxon')
    logger.info maily
  end

  def welcome_email(user: nil, invited_by: nil)
    token = LoginToken.create(user: user)
    @invited_by = invited_by
    @url = token_session_url(token: token)
    @user = user

    maily = mail(to: @user.email, subject: 'Welcome to Klaxon!')
    logger.info maily
  end

end
