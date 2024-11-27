class ReferralMailer < ApplicationMailer
  def send_referral(email, referrer, referral_token)
    @referrer = referrer
    @referral_link = "http://localhost:3001/signup?referral_token=#{CGI.escape(referral_token)}" 

    mail(
      to: email,
      subject: "You’re Invited to Join Our Platform!"
    )
  end
end