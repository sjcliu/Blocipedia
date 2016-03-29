class CollaboratorsController < ApplicationController
  def create
    Collaborator.create(params[:collaborator].permit!)
  end

  def new
    @collaborator = Collaborator.new.find_by(user_id: user.id, wiki_id: params[:wiki_id])
  end

  def index
    @users = User.all
  end
end
