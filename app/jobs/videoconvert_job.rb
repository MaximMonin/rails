class VideoconvertJob < ApplicationJob
  retry_on wait: 15.minutes, queue: :low_priority
  queue_as :low_priority

  def perform (filename)
    logger.info filename
    # Do something later
  end
end
