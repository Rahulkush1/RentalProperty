class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  paginates_per 10
  
end
