# Be sure to restart your server when you modify this file.
return unless Rails.env.test?

# Disable all remote HTTP request
require 'webmock/minitest'
WebMock.disable_net_connect!(allow_localhost: true)

# Allow to call classic Rails tasks
Rails.application.load_tasks

if defined?(CypressRails)
  
  # Called once, before either the transaction or the server is started
  CypressRails.hooks.before_server_start do
    ActiveJob::Base.queue_adapter.perform_enqueued_jobs = true
  end

  # Called after the transaction is started (at launch and after each reset)
  CypressRails.hooks.after_transaction_start do
  end

   # Triggered after `/cypress_rails_reset_state` is called
  CypressRails.hooks.after_state_reset do
    # Leaves the test datase clean & empty
    Rake::Task["db:schema:load"].invoke
    # Seed the database
    Rails.application.load_seed
  end

  CypressRails.hooks.before_server_stop do
    # Called once, at_exit
  end

end

