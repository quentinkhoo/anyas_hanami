require 'safe_ruby'

module Utils
  class SafeCommand
    def self.process(program)
      SafeRuby.eval(program)
    end
  end
end