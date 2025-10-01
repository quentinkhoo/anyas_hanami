# frozen_string_literal: true
require "safe_ruby"
require "utils/safe_command"

module AnyasHanami
  module Actions
    module Home
      class Index < AnyasHanami::Action
        def handle(request, response)
          user_input = ""
          output = ""

          if request.post?
            user_input = request.params[:user_input].to_s.strip

            output = Utils::SafeCommand.process(user_input)
          end

          # 5. Render the view, passing the input and output
          response.render(view, user_input: user_input, output: output)
        end
      end
    end
  end
end
