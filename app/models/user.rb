# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :text
#  password_digest :text
#  first_name      :text
#  last_name       :text
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ActiveRecord::Base
  has_secure_password

  has_many :flashcards
  has_many :scheduled_reviews
end
