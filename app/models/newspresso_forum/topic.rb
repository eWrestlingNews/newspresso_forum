module NewspressoForum
  class Topic < ActiveRecord::Base
    extend FriendlyId

    has_many :comments
    belongs_to :user

    acts_as_taggable
    acts_as_punchable

    friendly_id :slug_candidates, use: :slugged

    def slug_candidates
      [
        :title,
        [:title, :increment_slug]
      ]

    end

    def increment_slug
      self.class.where(title: self.title).count + 1
    end

    validates_presence_of :body, :title
  end
end
