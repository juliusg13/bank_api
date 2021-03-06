class TransfersController < ApplicationController

	def create
		@user = User.find(params[:user_id])

		if @user.transfers.create(transfer_params)
			redirect_to user_path(@user)
		else
			render 'users/show'
		end
	end

	def new
		@user = User.find(params[:user_id])
		@transfer = @user.transfers.new
	end

	private
	def transfer_params
		params.require(:transfer).permit(:account_number_from, :account_number_to, :amount_pennies, :country_code_from, :country_code_to)
	end


end
