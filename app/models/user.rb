class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :full_name, presence: true
  validates :birth_date, presence: true
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d{11}\z/, message: "deve ter 11 dígitos" }

  after_create :send_welcome_email 

  private

  def send_welcome_email
    UserMailer.with(user: self, password: self.password).welcome_email.deliver_now
  end
end