class Email < ActiveRecord::Base
  validates :mail, uniqueness: true

  attr_accessible :mail
end
