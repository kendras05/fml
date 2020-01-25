class User < ApplicationRecord

  has_secure_password
  has_many :grades
  belongs_to :course  
  
  validates :email, presence: true, uniqueness: true

  enum role: [:admin, :standard]
end

