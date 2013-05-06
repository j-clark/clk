class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :username
  has_secure_password

  has_many :posts
  validates_presence_of :password, :on => :create

  before_create do
    generate_token(:auth_token)
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token column
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end