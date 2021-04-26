class PostsController < ApplicationController

    def index
        @posts = Post.all
        render json: @posts.to_json(except: [:created_at, :updated_at])
    end

    def show
        @post = Post.find(params[:id])
        render json: @post.to_json(except: [:created_at, :updated_at])
    end

    
    def create
        @post = Post.new(post_params)
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
