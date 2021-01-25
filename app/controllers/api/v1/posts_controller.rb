class Api::V1::PostsController < ApplicationController

    def index
        @posts = Posts.all
        render json: @posts, only: [:title, :content]
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            render json: @post
        else
            render json: {error: @post.error.messages}
        end
    end

    def edit
        @post = Post.find(params[:id])
        if @post.destroy
            p "post destroyed"
        else
            render json: {error: @post.errors.messages}
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            p "post destroyed"
        else
            render json: {error: @post.errors.messages}
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :tags, :user_id)
    end
end
