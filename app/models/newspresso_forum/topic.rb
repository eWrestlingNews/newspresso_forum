module NewspressoForum
  class Topic < ActiveRecord::Base
    has_many :comments
    belongs_to :user

    acts_as_taggable

    validates_presence_of :body, :title
  end
end
