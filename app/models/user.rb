class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email, case_sensitive: false

  validates_presence_of :first_name, :last_name, :email
end
