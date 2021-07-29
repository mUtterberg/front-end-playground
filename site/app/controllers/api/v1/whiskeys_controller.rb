class Api::V1::WhiskeysController < ApplicationController
  before_action :set_whiskey, only: [:show, :edit, :update, :destroy]

  # GET /whiskeys
  # GET /whiskeys.json
  def index
    @whiskeys = Whiskey.all.order(brand: :asc)
    render json: @whiskeys
  end

  # GET /whiskeys/1
  # GET /whiskeys/1.json
  def show
    if @whiskey
      render json: @whiskey
    else
      render json: @whiskey.errors
    end
  end

  # GET /whiskeys/new
  def new
    @whiskey = Whiskey.new
  end

  # GET /whiskeys/1/edit
  def edit
  end

  # POST /whiskeys
  # POST /whiskeys.json
  def create
    puts 'Received POST request (create)'
    @whiskey = Whiskey.new(whiskey_params)

    if @whiskey.save
      render json: @whiskey
    else
      render json: @whiskey.errors
    end
  end

  # PATCH/PUT /whiskeys/1
  # PATCH/PUT /whiskeys/1.json
  def update
  end

  # DELETE /whiskeys/1
  # DELETE /whiskeys/1.json
  def destroy
    @whiskey.destroy

    render json: { notice: 'Whiskey was successfully removed.' }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_whiskey
    @whiskey = Whiskey.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def whiskey_params
    params.permit(:brand, :style, :name, :distiller, :abv, :proof, :rating)
  end
end
