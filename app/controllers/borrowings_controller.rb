class BorrowingsController < ApplicationController
    before_action :set_borrowing, only: [:show, :edit, :update, :destroy]
    def index
        @borrowings = Borrowing.all
        render json: @borrowings
    end

    def new
        @borrowing = Borrowing.new
    end

    def create
        @borrowing = Borrowing.new(borrowing_params)
        if @borrowing.save
            render plain: "Borrowing was successfully created!!"
        else
            render :new, status: 422
        end
    end

    def show
        @borrowing = Borrowing.find(params[:id])
    end
    def edit
        @borrowing = Borrowing.find(params[:id])
    end

    def update
        @borrowing = Borrowing.find(params[:id])
    
        if @borrowing.update(borrowing_params)
            render plain: "borrowing was update succesfully added"
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @borrowing = Borrowing.find(params[:id])
        @borrowing.destroy
    
        render plain: "borrower deleted succesfully "
    end

    private

    def set_borrowing
        @borrowing = Borrowing.find(params[:id])
        render plain: "Hey! I am set borrowing method."
    end

    def borrowing_params
       params.permit(:book_id, :borrower_id, :return_date)
    end
  
end
