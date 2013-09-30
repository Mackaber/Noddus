class EmailsController < ApplicationController
	
	def registrarmail
		@email = Email.new
		@email.mail = (params[:mail])
    	respond_to do |format|
	      if @email.save
	        format.html { redirect_to root_url, notice: 'Su email ha sido registrado.' }
	      else
	        format.html { redirect_to root_url, notice: 'Su email no ha podido ser registrado.' }
	      end
	    end  
	end

end
