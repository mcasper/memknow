# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :text             not null
#  last_name  :text
#  login      :text             not null
#  password   :text             not null
#  is_admin   :boolean          default("false"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :flashcards
  has_many :scheduled_reviews

  validates :first_name, :login, :password, :is_admin, presence: true
end
