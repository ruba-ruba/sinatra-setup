# frozen_string_literal: true

module Logging
  def self.included(receiver)
    receiver.extend self
  end

  def logger
    Application.common_logger
  end
end
