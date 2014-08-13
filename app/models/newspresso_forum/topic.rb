module NewspressoForum
  class Topic < ActiveRecord::Base
    acts_as_taggable
  end
end
