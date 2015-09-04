class UserSessionsController < ApplicationController
	def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(assignments_path, notice: 'Signed in successfully.')
    else
      flash.now.alert = "Signin failed."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(welcome_index_path, notice: 'Signed out!')
  end
end
