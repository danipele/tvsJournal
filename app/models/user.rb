class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true, on: [:create]
  validates :first_name, :last_name, presence: true, on: [:create]
  validate :password_verification, on: [:create]

  private

  def password_verification
    return if password.length >= 8 && password =~ /[0-9]/

    errors.add :password, 'must contain at least one digit and have at least 8 characters'
  end
end
