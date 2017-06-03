# frozen_string_literal: true

require 'digest'

class User < Sequel::Model
  plugin :whitelist_security
  plugin :validation_helpers

  def validate
    super
    validates_presence %i[email password]
    validates_unique :email
  end

  def before_create
    self.password = Digest::SHA1.hexdigest(password)
    super
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user if user && user.password == Digest::SHA1.hexdigest(password)
  end
end
