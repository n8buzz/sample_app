class User < ActiveRecord::Base
  attr_accessible :email, :name

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # / to indicate start and end of regex. i to indicate case-insensitivity

  validates :name, :presence => true, :length => {:maximum => 50}
  validates :email, :presence => true,
                    :format => {:with => email_regex},
                    :uniqueness => {:case_sensitive => false}
end
