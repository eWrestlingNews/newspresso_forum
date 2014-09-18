module NewspressoForum
  class Topic < ActiveRecord::Base
    extend FriendlyId

    has_many :comments
    belongs_to :user

    acts_as_taggable
    acts_as_punchable

    friendly_id :title, use: :slugged

    validates_presence_of :body, :title
  end
end
