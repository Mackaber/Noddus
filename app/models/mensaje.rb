class Mensaje < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :seen
end
