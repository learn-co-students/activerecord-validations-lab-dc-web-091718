class Author < ActiveRecord::Base
  #is invalid with no name
  validates :name, presence: true
  #is invalid with a short number--should be exactly 10 digits
  validates :phone_number,length: {is: 10}
  #author names should be unique
  validates :name, uniqueness: true


end
