require 'safe_ruby'

module Utils
  class SafeCommand
    def self.process(program)
      begin
        SafeRuby.eval(program)
      rescue Exception => e
        "Anya no understand what you trying to do."
      end
    end
  end
end