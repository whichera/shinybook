class Pokemon < ActiveRecord::Base
    belongs_to :user
    belongs_to :box
end
