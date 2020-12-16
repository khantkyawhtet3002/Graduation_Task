class ScoreMailer < ApplicationMailer
  def score_mail(customer, maker)
    @customer = customer
    @maker = maker
    mail to: "#{@maker.email}",
    subject: "Notice:::Customers have a score of over 100!!!"
  end
end
  
