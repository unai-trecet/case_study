class ApplicationRecord < ActiveRecord::Base
  include TokenGenerator

  self.abstract_class = true
end
