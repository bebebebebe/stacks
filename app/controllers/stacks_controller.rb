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
    id = stack.id
    @cards = Card.all.select { |card| card.stack_id == id }
    @blank_card = @cards.first
    @cards = @cards[1...@cards.length].reverse
  end

  # GET /stacks/new
  # GET /stacks/new.json
  def new
    @stack = Stack.create
    @card = @stack.cards.create
    redirect_to edit_card_path(@card)
  end

  # GET /stacks/1/edit
  def edit
    @stack = Stack.find(params[:id])
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
