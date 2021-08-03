# frozen_string_literal: true

# application service to inherit to children
class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
