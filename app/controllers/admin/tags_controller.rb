class Admin::TagsController < Admin::AdminController

  # Each and every action must be authorized
  before_action :authorize!
  
  before_action :set_tag, only: %i[ show edit update destroy ]

  # GET /tags
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to([:admin, @tag], notice: "Tag was successfully created.", triggered_validation: true)
    else
      flash.now[:alert] = 'Tag not created'
      render :new, status: :unprocessable_entity, locals: {triggered_validation: true}
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      redirect_to admin_tag_path(triggered_validation: true), notice: "Tag was successfully updated."
    else
      flash.now[:alert] = 'Tag not updated'
      render :edit, status: :unprocessable_entity, locals: {triggered_validation: true}
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
    redirect_to admin_tags_url, notice: "Tag was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params_h = params.require(:tag).permit(:shortname, :display_name, :description, article_ids: []).to_h.deep_symbolize_keys
      if params_h[:article_ids].present?
        params_h[:article_ids] = params_h[:article_ids].reject(&:blank?)
      end
      params_h
    end
end
