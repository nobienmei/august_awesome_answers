class HomeController < ApplicationController
def hello
    # render text: "Hello #{params}"
    # By default it will render a template named
    # hello.html.erb
    # inside folder: app/views/home/
  end

  def greet
    render text: "Hello #{params[:first_name]}"
  end

end
