class LabelsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @label = Label.new
    @search = Product.ransack(params[:q])
    if params[:label] && params[:label][:name]
      label_name = params[:label][:name]
      @labels = Label.where("name like '%#{label_name}%'")
    else
      @labels = Label.all
    end

  end

  def create
    @label = Label.new(label_params)
    @search = Product.ransack(params[:q])
    if params[:label] && params[:label][:name]
      label_name = params[:label][:name]
      @labels = Label.where("name like '%#{label_name}%'")
    else
      @labels = Label.all
    end
    if @label.save
      flash[:success] = "「#{@label.name}」保存されました。"
      redirect_to ('/labels')
    else
      render :index
    end
  end

  def edit
    @id_label = Label.find(params[:id]).id
    @label = Label.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @id_label = Label.find(params[:id]).id
    @label = Label.find(params[:id])
    @label.update(label_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy
    flash[:warning] = "「#{@label.name}」が削除されました"
    redirect_to ("/labels")
  end

  private
  def label_params
    params.require(:label).permit(:name)
  end

end
