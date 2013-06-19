class CardsController < ApplicationController

  # GET /cards/new
  # GET /cards/new.json
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
    @stack = Stack.find_by_id(@card.stack_id)

  end

  # POST /cards
  # POST /cards.json
  def create
     stack = Stack.find_by_id(1)
     @card = stack.cards.build(params[:card])
     @card.save!
    redirect_to edit_card_path(@card)
  end

  # PUT /cards/1
  # PUT /cards/1.json
  def update

    @card = Card.find(params[:id])
    @stack = Stack.find_by_id(@card.stack_id)


    @next_card = Card.new(params[:card])
    @next_card.stack_id = @card.stack_id
    @next_card.save
    redirect_to edit_card_path(@next_card)

  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card = Card.find(params[:id])
    @card.destroy
  end
end
