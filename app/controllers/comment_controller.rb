class CommentController < ApplicationController
  get '/comments/:id/new' do
    @post = Post.find_by(id: params[:id])
    erb :'/comments/new'
  end

  post '/comments/:id/new' do
    if params[:comment][:content] == nil || params[:comment][:content] == ""  
        redirect to "/comments/#{params[:id]}/new"
    else
        @comment = Comment.create(content: params[:comment][:content])
        @post = Post.find_by_id(params[:id])
        @post.comments << @comment
    end
    redirect to "/posts/#{params[:id]}/view"
  end


end