class SpicesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    def index
        spice = Spice.all
        render json: spice
    end

    # delete
    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end

    # create
    def create
        spice = Spice.create(spice_params)
        render json: spice, except:[:created_at,:updated_at], status: :created
    end

    # patch
    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end


    private

    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end
  
    def find_spice
      Spice.find(params[:id])
    end
  
    def render_not_found_response
      render json: { error: "Bird not found" }, status: :not_found
    end
  

end  