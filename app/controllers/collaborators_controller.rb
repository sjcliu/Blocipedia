class CollaboratorsController < ApplicationController
  def create
    Collaborator.create(params[:collaborator].permit!)
  end

  def new
    @collaborator = Collaborator.new
  end
end
