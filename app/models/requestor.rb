class Requestor < ApplicationRecord

  has_secure_password
  validates :emailId, presence: true, uniqueness: true
  validates_length_of :password, minimum: 6

end
