class PortfoliosController < ApplicationController
	# %i~ はハッシュの配列を作成する
	before_action :set_portfolio, only: %i[show edit update destroy]
	def index
		@items = Portfolio.all
	end

	def show
	end


	def new
		@portfolio = Portfolio.new
		3.times { @portfolio.technologies.build }
	end

	def create
		@portfolio = Portfolio.new(portfolio_params)

		respond_to do |format|
	      if @portfolio.save
	        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully created.' }
	        format.json { render :show, status: :created, location: @portfolio }
	      else
	        format.html { render :new }
	        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def edit
	end

	def update
		respond_to do |format|
	      if @portfolio.update(portfolio_params)
	        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
	        format.json { render :show, status: :ok, location: @portfolio }
	      else
	        format.html { render :edit }
	        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@portfolio.destroy
		respond_to do |format|
	      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
	    end
	end

	private

	def set_portfolio
		@portfolio = Portfolio.find(params[:id])
	end

	def portfolio_params
		params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image, :main_image, technologies_attributes: [:name])
	end
end
