class MemosController < ApplicationController
  def create
    # @memo = Memo.new(memo_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @memo = Memo.create(memo_params)
    authorize @memo
    @memo.enrollment = Enrollment.find(params[:enrollment_id])
    if @memo.save
      redirect_to lesson_path(@memo.enrollment.lesson)
    else
      render :new
    end
  end

  private
  def memo_params
    params.require(:memo).permit(:comment)
  end
end
