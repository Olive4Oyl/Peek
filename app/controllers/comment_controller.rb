class CommentController < ApplicationController
  get '/comments/new' do
    erb :'/comments/new'
  end

  post '/comments/new/:id' do
    if params[:comment][:content] == nil || params[:comment][:content] == ""
        #put a flash message here
        redirect to '/comments/new'
    else
        @comment = Comment.create(content: params[:comment][:content])
        @post = Post.find_by_id(params[:id])
        @post.comments << @comment
      end
      erb :'/posts/view'
    end

end
