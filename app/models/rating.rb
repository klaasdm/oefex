class Rating < ActiveRecord::Base
      attr_accessible :value

    belongs_to :show_room
    belongs_to :user

end
