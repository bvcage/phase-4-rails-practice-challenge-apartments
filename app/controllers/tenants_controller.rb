class TenantsController < ApplicationController
   rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message
   rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_message

   def index
      tenants = Tenant.all
      render json: tenants
   end

   def show
      tenant = Tenant.find_by!(id: params[:id])
      render json: tenant
   end

   def create
      tenant = Tenant.create!(tenant_params)
      render json: tenant
   end

   def update
      tenant = Tenant.find_by!(id: params[:id])
      tenant.update(tenant_params)
      render json: tenant
   end

   def destroy
      tenant = Tenant.find_by!(id: params[:id])
      tenant.destroy
      head :no_content
   end

   private

   def tenant_params
      params.permit(:name, :age)
   end

   def record_invalid_message error
      render json: { "error": error.to_s }
   end
   
   def record_not_found_message
      render json: { "error": "tenant not found"}
   end
end
