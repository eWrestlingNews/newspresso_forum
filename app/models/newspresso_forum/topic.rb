module NewspressoForum
  class Topic < ActiveRecord::Base
    has_many :comments
    belongs_to :user

    acts_as_taggable
    acts_as_punchable

    validates_presence_of :body, :title
  end
end
