class CustomerCommentsController < ApplicationController
  before_action :set_customer_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_customer!, only: [:edit, :create, :destroy]

  def create
    @customer_comment = CustomerComment.new(customer_comment_params)
    @customer_comment.customer = current_customer
    if @customer_comment.save
      redirect_to evaluate_url(id: @customer_comment.evaluate_id), notice: "Customer Commented"
    else
      @evaluate = @customer_comment.evaluate
      flash[:alert] = @customer_comment.errors.full_messages
      redirect_back fallback_location: @evaluate.customer_comments
    end
  end

  def edit
  end

  def update
    if @customer_comment.update(customer_comment_params)
      redirect_to evaluate_url(id: @customer_comment.evaluate_id), notice: "Edited Customer Comment"
    else
      @evaluate = @customer_comment.evaluate
      flash[:alert] = @customer_comment.errors.full_messages
      redirect_back fallback_location: @evaluate.customer_comments
    end
  end

  def destroy
    @customer_comment.destroy
    redirect_to evaluate_url(id: @customer_comment.evaluate_id), notice: "Deleted Customer Comment"
  end


  private

  def set_customer_comment
    @customer_comment = CustomerComment.find(params[:id])
  end

  def customer_comment_params
    params.require(:customer_comment).permit(:evaluate_id, :customer_id, :content)
  end
  
end
