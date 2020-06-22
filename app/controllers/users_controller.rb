class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome #{@user.username}, you are now part of the Alpha community."
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @user.update(article_params)
            flash[:notice] = "Your account has been updated."
            redirect_to @user
        else
            render 'edit'
        end
    end

    def index
        @users = User.all
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end 