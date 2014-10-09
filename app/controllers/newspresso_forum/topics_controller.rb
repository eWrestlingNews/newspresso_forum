module NewspressoForum
  class TopicsController < ::ApplicationController
    authorize_resource only: [:new, :edit, :update, :create]
    before_action :set_topic, only: [:show, :edit, :update, :destroy]
    before_action :set_categories

    # GET /topics
    def index
      @category = params[:tag]
      @topics = \
        case @category
        when nil
          Topic.all
        else
          Topic.tagged_with(@category)
        end
      @topics = @topics.order("updated_at desc").page(params[:page])
    end

    # GET /topics/1
    def show
      @new_comment = @topic.comments.build
      @topic.punch
    end

    # GET /topics/new
    def new
      @topic = Topic.new
    end

    # GET /topics/1/edit
    def edit
    end

    # POST /topics
    def create
      @topic = Topic.new(topic_params)
      @topic.user = current_user

      if @topic.save
        redirect_to @topic, notice: 'Topic was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /topics/1
    def update
      if @topic.update(topic_params)
        redirect_to @topic, notice: 'Topic was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /topics/1
    def destroy
      @topic.destroy
      redirect_to topics_url, notice: 'Topic was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_topic
        @topic = Topic.friendly.find(params[:id])
      end

      def set_categories
        @categories = Topic.categories
      end

      # Only allow a trusted parameter "white list" through.
      def topic_params
        params.require(:topic).permit(:title, :body, :tag_list)
      end
  end
end
