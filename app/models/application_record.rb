class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
   belongs_to :product
  belongs_to :user   
end
