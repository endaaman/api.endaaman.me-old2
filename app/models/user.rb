# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#

class User < ApplicationRecord
  has_secure_password

  validates :username, :presence => true
  validates :password, :confirmation => true

  def authenticate(unencrypted_password)
    BCrypt::Password.new(password_digest) == unencrypted_password && true
  end
end
