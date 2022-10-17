class ApartmentsController < ApplicationController
   rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message
   rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_message

   def index
      apartments = Apartment.all
      render json: apartments
   end

   def show
      apartment = Apartment.find_by!(id: params[:id])
      render json: apartment
   end

   def create
      apartment = Apartment.create(apartment_params)
      render json: apartment
   end

   def update
      apartment = Apartment.find_by!(id: params[:id])
      apartment.update(apartment_params)
      render json: apartment
   end

   def destroy
      apartment = Apartment.find_by!(id: params[:id])
      apartment.destroy
      head :no_content
   end

   private

   def apartment_params
      params.permit(:number)
   end

   def record_invalid_message error
      render json: { "error": error.to_s }
   end
   
   def record_not_found_message
      { "error": "apartment not found"}
   end

end
