require 'token_generator'

class Employee < ApplicationRecord
  belongs_to :company

  set_token({ blocks_number: 3 })

  validates_presence_of :first_name, :last_name, :company_id, :identify
  validates_uniqueness_of :identify
end
