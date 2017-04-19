class Api::V1::TonesController < ApplicationController
  def index
    render status: 200, json: Tone.get(params["text"])
  end
end
