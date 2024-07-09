class PrototypesController < ApplicationController
  def index
    #@prototypes = Prototype
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)

    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

    def destroy
      @prototype = Prototype.find(params[:id])
      redirect_to root_path
    end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image ).merge(user_id: current_user.id)
  end
end