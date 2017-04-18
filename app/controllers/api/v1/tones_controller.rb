class Api::V1::TonesController < ApplicationController

  def index
    render json: Tone.get
  end
end
