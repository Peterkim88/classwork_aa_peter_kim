class ArtworkSharesController < ApplicationController
    def create
        shared = ArtworkShare.new(artwork_share_params)
        if shared.save
            render json: shared
        else
            render json: shared.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        shared = ArtworkShare.find(params[:id])
        if shared.destroy
            render json: shared
        else
            render json: shared.errors.full_messages, status: 422
        end
    end

    private
    def artwork_share_params
        params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
    end
end
