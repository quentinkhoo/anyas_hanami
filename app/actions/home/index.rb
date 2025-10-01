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
            # 1. Get the sanitized input from the form params
            user_input = request.params[:user_input].to_s.strip

            # # 2. Define the safe, unchangeable command we will run
            # command = "ls"
            # args = ["-la", user_input] # The user input is ONLY an argument

            # # 3. Safely execute the command
            # # Open3 prevents shell injection by separating the command from arguments
            # stdout, stderr, status = Open3.capture3(command, *args)

            output = Utils::SafeCommand.process(user_input)
          end

          # 5. Render the view, passing the input and output
          response.render(view, user_input: user_input, output: output)
        end
      end
    end
  end
end
