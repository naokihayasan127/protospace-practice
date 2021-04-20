class PrototypesController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototypes_params)
    # ビフォーアアクションによって上記の記述は不必要になる
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    # ビフォーアアクションによって上記の記述は不必要になる
  end

  def edit
    @prototype = Prototype.find(params[:id])
    # ビフォーアアクションによって上記の記述は不必要になる
  end

  def update
    
    @prototype = Prototype.find(params[:id])
    # ビフォーアアクションによって上記の記述は不必要になる
    if @prototype.update(prototypes_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end
  
  def destroy
    @prototype = Prototype.find(params[:id])
    # ビフォーアアクションによって上記の記述は不必要になる
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def prototypes_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
