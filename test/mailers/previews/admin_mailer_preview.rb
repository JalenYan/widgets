# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/new_widget_from_new_manufacturer
  def new_widget_from_new_manufacturer
    AdminMailer.new_widget_from_new_manufacturer
  end
end
