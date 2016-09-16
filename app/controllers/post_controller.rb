class PostController < ApplicationController
  get '/new' do
    erb :'/posts/new'
  end

  post 'posts/new' do
    if params[:post][:content] == nil || params[:post][:content] == ""
      #insert flash message
      redirect to '/posts/new'
    else
      @post = Post.create(content: params[:post][:content])
      @user = User.find_by_id(session[:id])
      @post.likes = 0
      @post.dislikes = 0
      @user.posts << @post
      @post.user =  @user
    end
    erb :'/users/home'
  end

  get '/posts/:id/view' do
    @post = Post.find(params[:id])
    erb :'/posts/view'
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :'/posts/show'
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :'/posts/edit'
  end

end
