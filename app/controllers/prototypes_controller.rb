class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: new }), alert: 'YNew prototype was unsuccessfully created'
     end
  end

  def show
    @likes = @prototype.likes
  end

  def edit
    @main_image = @prototype.captured_images.main.first
    @sub_images = @prototype.set_sub_thumbnails
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to ({ action: :show }), notice: 'Your prototype was successfully updated'
    else
      render ({ action: :edit }), alert: 'Your prototype was unsuccessfully updated'
    end
  end

  def destroy
    if @prototype.destroy
      redirect_to :root, notice: "The prototype was successfully deleted"
    else
      render ({ action: :show }), alert: "The prototype was unsuccessfully deleted"
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:id, :content, :status]
    )
  end
end
