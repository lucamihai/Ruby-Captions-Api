class CaptionsController < ApplicationController
  def index
    captions = Caption.all
    render json:  {captions: captions}
  end

  def create
    attributes = params.require(:caption).permit(:url, :text)
    caption = Caption.create(attributes)
    render json: {caption: caption}, status: 201
  end
end
