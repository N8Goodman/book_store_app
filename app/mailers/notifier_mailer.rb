class NotifierMailer < ApplicationMailer
  def review_added_email(review)
    @review = review
    mail(
      to: review.bookstore.user.email,
      subject: "New review for #{review.bookstore.name}"
    )
  end
end
