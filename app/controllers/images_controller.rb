class ImagesController < ApplicationController
   def index
    images = Image.all
    render json: images.as_json
    end
    def create
    image = Image.new( {
                        image: params[:image_url],
                       })
    image.save
    render json: image.as_json
  end
    def show
    image = Image.find(params[:id])
    render json: image.as_json
  end 
  def update
    image = Image.find(params[:id])
    movie.name = image[:image_url] || movie.image_url
    image.save
    render json: image.as_json
 end 
 def destroy
   image = Image.find(params[:id])
   image.destroy    
   render json: {message: "Successfully destroyed image ##{image.id}"}
 end
end   
