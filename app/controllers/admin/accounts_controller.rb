 class Admin::AccountsController < Admin::AdminController

  # Each and every action must be authorized
  before_action :authorize!
  
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /accounts
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new(profile: Profile.new(name: ""))
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  def create
    @account = Account.new(account_params.merge({profile: Profile.new(profile_params)}))
    # Account create by an admin is considered as valid by default
    @account.status = "verified"
    if [@account.valid?, @account.profile.valid?].all?
      @account.save
      redirect_to([:admin, @account], notice: "Account was successfully created.", triggered_validation: true)
    else
      @errors_h = merge_errors(@account, @account.profile)
      flash.now[:alert] = 'Account not created'
      render :new, status: :unprocessable_entity, locals: {triggered_validation: true}
    end
  end

  # PATCH/PUT /accounts/1
  def update
    # password cannot be updated in the admin, going to the /reset-password-request is more robust
    local_params = account_params.except(:password)
    local_params[:profile_attributes] = profile_params
    if @account.update(local_params)
      redirect_to admin_account_path(triggered_validation: true), notice: "Account was successfully updated."
    else
      @errors_h = merge_errors(@account, @account.profile)
      flash.now[:alert] = 'Account not updated.'
      render :edit, status: :unprocessable_entity, locals: {triggered_validation: true}
    end

  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
    redirect_to admin_accounts_url, notice: "Account was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:email, :password, :role).to_h
    end

    def profile_params
      params.require(:account).permit(:name).to_h
    end

    def merge_errors(obj1, obj2)
      obj1.errors.to_hash.merge(obj2.errors.to_hash)
    end
end
