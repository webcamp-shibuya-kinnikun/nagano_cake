class Admins::SearchsController < ApplicationController
  def search
    @content = params[:content]
    @model = params[:model]
    if @model == "customer"
      @customers = Customer.search(@content)
    else
      @items = Item.search(@content)
    end
  end
end
