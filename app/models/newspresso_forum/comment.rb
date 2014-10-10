module NewspressoForum
  class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :topic, touch: true

    validates_presence_of :body

    has_merit
  end
end
