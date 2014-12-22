module NewspressoForum
  class TopicsController < ::ApplicationController
    authorize_resource only: [:new, :edit, :update, :create]
    before_action :set_topic, except: [ :index, :latest, :top ]
    before_action :set_categories

    # GET /topics
    def index
      @title = "Wrestling Forums, WWE Forum, TNA, iMPACT, UFC/MMA Forums"
      @keywords = "Wrestling Forums, WWE Forum, TNA, iMPACT, UFC/MMA Forums"
      @category = params[:tag]
      @topics = \
        case @category
        when nil
          Topic.all
        else
          Topic.tagged_with(@category)
        end
      @topics = @topics.order("updated_at desc").includes(:tags).page(params[:page])
    end

    def latest
      @title = "Latest discussions on wrestling, WWE news, TNA, iMPACT and UFC/MMA"
      @keywords = "Wrestling Forums, WWE Forum, TNA, iMPACT, UFC/MMA Forums"
      @topics = Topic.order("created_at desc").includes(:tags).page(params[:page])
      render :index
    end

    def top
      @title = "Top discussions on wrestling, WWE news, TNA, iMPACT and UFC/MMA"
      @keywords = "Wrestling Forums, WWE Forum, TNA, iMPACT, UFC/MMA Forums"
      @topics = Topic.most_hit.includes(:tags).page(params[:page])
      render :index
    end

    # GET /topics/1
    def show
      @topic.punch
      @title = @topic.title
      @keywords = [@topic.tag_list, @topic.title].join(', ')
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
        award_points(10)
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

    def close
      @topic.close!
      redirect_to @topic, notice: "This topic has been closed"
    end

    def open
      @topic.open!
      redirect_to @topic, notice: "This topic has been reopened"
    end

    def unexpire
      @topic.unexpire!
      redirect_to @topic, notice: "Topic has been marked unexpired"
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_topic
        @topic = Topic.friendly.find(params[:id] || params[:topic_id])
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
