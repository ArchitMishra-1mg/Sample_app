class ApplicationController < ActionController::Base
  def hello
    render html: "Chaliye shuru karte hai..."
  end
end
