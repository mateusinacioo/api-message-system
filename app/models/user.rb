class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :full_name, presence: true
  validates :birth_date, presence: true
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d{11}\z/, message: "deve ter 11 dígitos" }

  def active?
    status
  end
end