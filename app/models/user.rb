class User < ApplicationRecord
end

  has_secure_password  
  
  validates :email, presence: true, uniqueness: true

  enum role: [:admin, :standard]
end

