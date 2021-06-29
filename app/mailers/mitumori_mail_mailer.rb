class MitumoriMailMailer < ApplicationMailer
    default from: "example@example.com"   # 送信元アドレス

  def send_email(mitumori_form)
    @mitumori_form = mitumori_form
    mail(:to => mitumori_form.email, :subject => '見積書が届いています') # :to 送信先アドレス, :subject 件名
  end
end
