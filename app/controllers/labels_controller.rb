class LabelsController < ApplicationController
  def index
    @label = Label.new
    @labels = Label.all

  end

  def create
    label = Label.new(label_params)
    label.save
    flash[:notice] = "保存されました。"
    redirect_to ('/labels')
  end

  private
  def label_params
    params.require(:label).permit(:name)
  end

end