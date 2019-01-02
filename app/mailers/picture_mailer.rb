class PictureMailer < ApplicationMailer

  def picture_mail(picture)
    @picture = picture

    mail to: "localhost:3000", subject: "新しいPost完了の確認メール"
  end
end
