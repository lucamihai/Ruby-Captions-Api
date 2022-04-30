class CaptionsController < ApplicationController
  def index
    captions = [
      {
        id: 1,
        url: "https://example.com/image.png",
        text: "Hello World",
        caption_url: ""
      },
      {
        id: 124,
        url: "",
        text: "",
        caption_url: ""
      }
    ]
    render json:  {captions: captions}
  end

  def create
    render :json => request.body.read, :status => 201
  end
end
