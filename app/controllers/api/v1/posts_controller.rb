class Api::V1::PostsController < ApplicationController

    before_action :authorized, only: [:create]

    def index
        @posts = Post.all
        render json: @posts
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
    end

    
    def create
        @post = @user.posts.new(content: params[:content])
        if @post.save
            render json: @post
        else
            render json: {error: @post.errors.full_messages}
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            render json: @post
        else
            render json: {
                status: 500,
                message: "Something went wrong"
            }
        end
    end
    

    def destroy
        @post = Post.find(params[:id])
        @post.destroy 
    end

    private

    def post_params
        params.require(:post).permit(:content, :user_id, :tags)
    end
end
