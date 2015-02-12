class Company < ActiveRecord::Base
  validates_presence_of :name

  has_many :car_parks
end
