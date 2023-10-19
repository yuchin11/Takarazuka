class YuchinsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @yuchins = Yuchin.all
      search = params[:search] 
        @yuchins = @yuchins.joins(:user).where("kumi LIKE ? OR show LIKE ?", "%#{search}%", "%#{search}%")  if search.present?
    end
  
  def new
      @yuchin = Yuchin.new
  end
    
  def create
      @yuchin = Yuchin.new(yuchin_params)
      @yuchin.user_id = current_user.id
      if @yuchin.save!
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
      
  end

  def show
    @yuchin = Yuchin.find(params[:id])
    @comments = @yuchin.comments
    @comment = Comment.new
  end
    
def edit
  @yuchin = Yuchin.find(params[:id])
end

def update
  yuchin = Yuchin.find(params[:id])
  if yuchin.update(yuchin_params)
    redirect_to :action => "show", :id => yuchin.id
  else
    redirect_to :action => "new"
  end
end

    private
    def yuchin_params
      params.require(:yuchin).permit(:kumi, :show, :price, :omoi, :image, :level)
    end
  end