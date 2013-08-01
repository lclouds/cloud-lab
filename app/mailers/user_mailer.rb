class UserMailer < ActionMailer::Base
  default from: "shuchuan_chen@126.com"
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
end
