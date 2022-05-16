class Admin::MigrateDataController < Admin::AdminController

  # Migrate some data here
  # Ensure that the migration can only be run once, not twice.
  #
  # Example :    
  #
  # if Tag.last.description != "Description of all tags was resetted by migration"
  #   Tag.update_all(description: "Description of all tags was resetted by migration")
  # end
  #
  # message = "Migration successful. Each tag has now the same description."
  def update
    authorize! :admin
    message = "No actual migration was run. Adapt app/controllers/admin/migrate_data_controller.rb to run any migration and add a custom message."
    redirect_to admin_migrate_data_path(message: message)
  end

  def show
    authorize! :admin
  end

end
