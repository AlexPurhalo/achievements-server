class PersonsController < ApplicationController
  def index
    @persons = User.all
    render json: @persons
  end
end