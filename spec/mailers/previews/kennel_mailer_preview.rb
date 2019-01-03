# Preview all emails at http://localhost:3000/rails/mailers/kennel_mailer
class KennelMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/kennel_mailer/reservation_confirmation
  def reservation_confirmation
    KennelMailerMailer.reservation_confirmation
  end

end
