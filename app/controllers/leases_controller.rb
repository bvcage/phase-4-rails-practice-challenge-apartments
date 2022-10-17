class LeasesController < ApplicationController
   rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message
   rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_message

   def create
      lease = Lease.create!(lease_params)
      render json: lease
   end

   def delete
      lease = Lease.find_by!(id: params[:id])
      lease.destroy
      head :no_content
   end

   private

   def lease_params
      params.permit(:apartment_id, :tenant_id)
   end

   def record_invalid_message error
      render json: { "error": error.to_s }
   end

   def record_not_found_message
      { "error": "lease not found" }
   end

end
