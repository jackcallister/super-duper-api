class Meal < ActiveRecord::Base
  acts_as_taggable_on :ingredients
  belongs_to :user
end
