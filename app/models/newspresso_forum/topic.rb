module NewspressoForum
  class Topic < ActiveRecord::Base
    extend FriendlyId

    has_many :comments
    belongs_to :user

    acts_as_taggable
    acts_as_punchable

    friendly_id :slug_candidates, use: :slugged

    validates_presence_of :body, :title

    #
    # Tests if the topic is in an expired state
    #
    # @return [Bool]
    def expired?
      created_at < topic_expiration.days.ago and updated_at < topic_expiration.days.ago
    end

    #
    # Update the updated_at to reset the topic expiration date
    #
    def unexpire!
      update_attribute(:updated_at, Time.now)
    end

    private

    #
    # Update the slug to add an integer if already exists
    #
    def increment_slug
      self.class.where(title: self.title).count + 1
    end

    #
    # Candidates for the slug
    #
    # @return [Array] Array of slug candidates
    def slug_candidates
      [
        :title,
        [:title, :increment_slug]
      ]

    end

    #
    # Return the count used for topic expirations
    #
    # @return [Integer] Either defined TOPIC_EXPIRATION_DAYS or 14 as default
    def topic_expiration
      AppConfig['TOPIC_EXPIRATION_DAYS'] || 14
    end
  end
end
