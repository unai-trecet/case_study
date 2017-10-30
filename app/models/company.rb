require 'token_generator'

class Company < ApplicationRecord
  has_many :employees, dependent: :destroy

  set_token({ separator: ':' })

  validates_presence_of :name, :identify
  validates_uniqueness_of :name, :identify

end
