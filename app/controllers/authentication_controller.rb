

class AuthenticationController < ApplicationController

skip_before_action :authenticate_request
	def authenticate
		command = AuthenticateUser.call(params[:email], params[:password])
		if command.success?
			#pasar el token por header en inicio de sesion 
			#response envio al cliente
			response.headers["jwt"] = command.result

			#render json: { message: ["Login successful"] }, status: :ok
			render json: { token: command.result }, status: :ok
		else
		render json: { error: command.errors }, status: :unauthorized
		end
	end	
end