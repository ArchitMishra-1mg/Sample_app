class ApplicationController < ActionController::Base
  # def hello
  #   render html: "Chaliye shuru karte hai..."
  # end
  include SessionsHelper          # module sessions helper coz it would be needed in all controllers.
end
