class MitumoriMailMailer < ApplicationMailer

  def send_email(mitumori_form)
    @mitumori_form = mitumori_form
    mail(:from => mitumori_form.from_mail_address, :to => mitumori_form.to_mail_address, :subject => '見積書が届いています') # :to 送信先アドレス, :subject 件名
  end
end
