class WhiskeysController < ApplicationController
  before_action :set_whiskey, only: [:show, :edit, :update, :destroy]
  def index
  end
end
