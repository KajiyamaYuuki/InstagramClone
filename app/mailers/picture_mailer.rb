class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: "luv4u.1331@gmail.com", subject: "投稿完了メール"
  end
end
