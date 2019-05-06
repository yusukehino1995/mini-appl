class ContentsController < ApplicationController

  before_action :move_to_contents_index, except: :index

  def index
    @contents = Content.all.order("id DESC").page(params[:page]).per(5)
  end

  def new
    @content = Content.new
  end

  def create
    Content.create(nickname: content_params[:nickname], title: content_params[:title], text: content_params[:text], user_id: current_user.id)
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    content = Content.find(params[:id])
    if content.user_id == current_user.id
      content.update(content_params)
    end
  end

  def destroy
      content = Content.find(params[:id])
      content.destroy #if content.user_id == current_user.id
  end

  private
  def content_params
    params.require(:content).permit(:nickname, :title, :text)
  end

  def move_to_contents_index
      redirect_to action: :index unless user_signed_in?
  end

end
