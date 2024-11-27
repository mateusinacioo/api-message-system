class UserMailer < ApplicationMailer
  default from: "no-reply@appmessage.com"

  def welcome_email
    @user = params[:user]
    @password = params[:password]
    mail(to: @user.email, subject: "🎉 Bem-vindo(a) ao Sistema de Mensagens!")
  end
end