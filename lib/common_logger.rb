# frozen_string_literal: true

require 'forwardable'

module Logging
  def self.included(receiver)
    receiver.extend self
  end

  def logger
    Application.common_logger
  end
end

class CommonLogger
  extend Forwardable

  def_delegators :logger, :info, :warn, :debug, :fatal, :unknown, :error

  def initialize(level)
    @level = level
  end

  def logger
    if @_logger.nil?
      @_logger = Logger.new STDOUT
      @_logger.level = @level
      @_logger.datetime_format = '%a %d-%m-%Y %H%M '
    end
    @_logger
  end
end
