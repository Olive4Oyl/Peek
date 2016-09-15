class PostController < ApplicationController
  get '/new' do
    erb :'/posts/new'
  end

  post '/new' do
    if params[:post][:content] == nil || params[:post][:content] == ""
      #insert flash message
      redirect to '/posts/new'
    else
      @post = Post.create(content: params[:post][:content])
      @user = User.find_by_id(session[:id])
      @user.posts << @post
      @post.user =  @user
    end
    erb :'/users/home'
  end

  
end