class Notifier < ApplicationMailer
  default from: 'notifications@example.com'
 
  def order_email(order)
    @order = order
    
    mail(to: order.email, subject: 'Welcome to My Awesome Site')
  end
end
