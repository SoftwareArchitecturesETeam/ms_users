class WsusersController < ApplicationController
  soap_service namespace: 'urn:WashOutUser', camelize_wsdl: :lower

  soap_action "check",
              :args => {:email => :string},
              return => :boolean

  def check
    @req_mail = params[:email]
    exists  = false
    if (Users.exists?(email: @req_mail))
      exists = true
    end
    render :soap => exists
end
