class Petition < ActiveRecord::Base
  belongs_to :mascotum
  belongs_to :user
end
