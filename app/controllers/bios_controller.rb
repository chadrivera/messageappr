class BiosController < ApplicationController
  def show
    @name = request.path.split('/').last.capitalize
  end

  private

end
