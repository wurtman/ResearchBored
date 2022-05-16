class HelloWorldJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Add a small delay, like a time-consuming job would do.
    sleep 1
    # Let's see in logs if Job ran correctly
    p "hello from HelloWorldJob #{Time.now().strftime('%F - %H:%M:%S.%L')}"
  end

end
