class Admin::EditablesController < Admin::AdminController

  # Each and every action must be authorized
  before_action :authorize!
  
  before_action :set_editable, only: %i[ show edit update destroy ]

  # GET /editables
  def index
    @editables = Editable.all
  end

  # GET /editables/1
  def show
  end

  # GET /editables/new
  def new
    @editable = Editable.new
  end

  # GET /editables/1/edit
  def edit
  end

  # POST /editables
  def create
    @editable = Editable.new(editable_params)

    if @editable.save
      redirect_to([:admin, @editable], notice: "Editable was successfully created.", triggered_validation: true)
    else
      flash.now[:alert] = 'Editable not created'
      render :new, status: :unprocessable_entity, locals: {triggered_validation: true}
    end
  end

  # PATCH/PUT /editables/1
  def update
    if @editable.update(editable_params)
      redirect_to admin_editable_path(triggered_validation: true), notice: "Editable was successfully updated."
    else
      flash.now[:alert] = 'Editable not updated'
      render :edit, status: :unprocessable_entity, locals: {triggered_validation: true}
    end
  end

  # DELETE /editables/1
  def destroy
    @editable.destroy
    redirect_to admin_editables_url, notice: "Editable was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editable
      @editable = Editable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def editable_params
      params.require(:editable).permit(:shortname, :kontent, :description)
    end
end
