class StacksController < ApplicationController
  # GET /stacks
  # GET /stacks.json
  def index
    @stacks = Stack.all
  end

  # GET /stacks/1
  # GET /stacks/1.json
  def show
    stack = Stack.find(params[:id])
    @cards = stack.cards
    @blank_card = @cards.last
    @cards = @cards[0...@cards.length-1]
  end

  # GET /stacks/new
  # GET /stacks/new.json
  def new
    @stack = Stack.create
    @card = @stack.cards.create
    redirect_to edit_card_path(@card)
  end


  # POST /stacks
  # POST /stacks.json
  def create
    @stack = Stack.new(params[:stack])
  end

  # PUT /stacks/1
  # PUT /stacks/1.json
  def update
    @stack = Stack.find(params[:id])
  end

  # DELETE /stacks/1
  # DELETE /stacks/1.json
  def destroy
    @stack = Stack.find(params[:id])
    @stack.destroy
  end
end
