class SessionsController < ApplicationController
  def new
    @trainer = Trainer.new
  end

#   def omniauth
#     binding.pry
#     trainer = Trainer.find_or_create_by(username: request.env['email']) do |u|
#         u.password = 'asdfghjkl'
#     end 
#     trainer.save 
#     session[:trainer_id] = trainer.id 
#     redirect_to root_path 
#  end 

  # def omniauth
  #   binding.pry
  #   trainer = Trainer.find_or_create_by(id: auth['uid'], email: auth['info']['email']) do |u|
  #     u.username = auth['info']['first_name']
  #     u.email = auth['info']['email']
  #     u.password = auth['info']['password']
  #   binding.pry
  #   end
  #   if trainer.valid?
  #     redirect_to trainer_path
  #   else
  #     #flash[:message] = trainer.errors.full_message.join(", ")
  #     redirect_to root_path
  #   end
  # end

  def omniauth 
    trainer = Trainer.find_or_create_by_omniauth(auth)
    if trainer.valid?
      session[:trainer_id] = trainer.id
      redirect_to trainer_path(trainer)  
    else
      #flash[:error] = user.errors.full_messages.join(", ")
      redirect_to root_path
    end
  end


  def create
    @trainer = Trainer.find_by(username: params[:trainer][:username])
    if @trainer && @trainer.authenticate(params[:trainer][:password])
      session[:trainer_id] = @trainer.id
      redirect_to trainer_path(@trainer)
    else
      flash[:error] = "Invalid username or password"
      redirect_to root_url
    end
  end
  
  def destroy
    session.delete :username
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']

  end



end


