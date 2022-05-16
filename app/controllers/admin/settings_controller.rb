class Admin::SettingsController < Admin::AdminController
  before_action :set_setting, only: %i[ index update ]

  # GET /settings
  def index
    authorize! :admin
  end

  # PATCH/PUT /settings/1
  def update
    authorize! :admin
    if @setting.update(setting_params)
      redirect_to admin_settings_path(triggered_validation: true), notice: "Settings were successfully updated."
    else
      flash.now[:alert] = 'Settings not updated'
      render :index, status: :unprocessable_entity, locals: {triggered_validation: true}
    end
  end

  private

    def set_setting
      @setting = Setting.first
    end

    def setting_params
      params.require(:setting).permit(:shareable_draft, :clock_diff)
    end
end
