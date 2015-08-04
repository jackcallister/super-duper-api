class Meal < ActiveRecord::Base
  acts_as_taggable_on :ingredients
end
