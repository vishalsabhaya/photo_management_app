class User < ApplicationRecord
  # user_name must be reuqired, length between 10 to 30, must be uniq
  validates :user_name, presence: true,
                        length: {minimum:10, maximum:30},
                        format: {with: /\A[a-zA-Z0-9]+\Z/},
                        uniqueness: true

  has_secure_password
  # password must be reuqired, miminum 8 character
  validates :password, presence: true,
                       length: {minimum:8}
end