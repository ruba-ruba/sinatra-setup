# frozen_string_literal: true

require 'forwardable'

class CommonLogger
  extend Forwardable

  def_delegators :logger, :info, :warn, :debug, :fatal, :unknown, :error

  def initialize(level, options = {})
    @level = level
    @progname = options[:name]
  end

  def logger
    if @_logger.nil?
      @_logger = Logger.new STDOUT
      @_logger.level = @level
      @_logger.progname = @progname
      @_logger.datetime_format = '%a %d-%m-%Y %H%M '
    end
    @_logger
  end
end
