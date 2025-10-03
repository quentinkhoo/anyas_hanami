# frozen_string_literal: true

require "hanami"
require "dotenv"

module AnyasHanami
  class App < Hanami::App
    Dotenv.load(".env")
  end
end
