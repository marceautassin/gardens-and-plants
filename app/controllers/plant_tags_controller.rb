class PlantTagsController < ApplicationController

  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create

    tags = Tag.where(id: params.dig(:plant_tag, :tag))
    @plant = Plant.find(params[:plant_id])
    tags.each do |tag|
      @plant_tag = PlantTag.new(tag: tag, plant: @plant)
      @plant_tag.save
    end
    redirect_to garden_path(@plant_tag.plant.garden)
  end
end
