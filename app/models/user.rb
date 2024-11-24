class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :full_name, presence: true
  validates :birth_date, presence: true
  validates :cpf, presence: true, uniqueness: true
end


