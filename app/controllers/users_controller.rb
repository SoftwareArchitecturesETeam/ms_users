class UsersController < ApplicationController
before_action :set_user, only: [:show, :update, :destroy]
  #before_action :authenticate_user, except:[:index]
  skip_before_action :authenticate_request, only:[:create]
  # GET /users
  def index
    @users = User.all

    puts "serializador user"
    puts UserSerializer
    render json: @users, each_serializer:UserSerializer

  end

  # GET /users/1
  def show
    render json: @user,serializer:UserSerializer
  end

  def testSession
    render json: current_user, serializer: UserSerializer
  end

  def logout 
    response.headers["jwt"] = nil
    render json: {message: "logout successful"}, status: :ok
  end
  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def search    
    
    if params.has_key?(:q)
        @users_name = User.users_by_name("%#{params[:q]}%")
#       render json: @products, :include => [:product]
       render json: @users_name, each_serializer:UserSerializer
            
    else
        @users = User.all
      
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :age, :password, :password_confirmation)
    end
end
