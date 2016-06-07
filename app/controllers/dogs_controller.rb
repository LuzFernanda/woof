class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.all
  end

def search
  @dogs = Dog.order("date DESC")
     #AQUI  SE FILTRA RAZA
    if params[:raza].present?
      @dogs = @dogs.where("raza ILIKE ?", "%#{params[:raza]}%")
    end
     #AQUI BUSCA GENERO 
    if params[:gender].present?
      @dogs = @dogs.where("gender ILIKE ?", "%#{params[:gender]}%")
    end 
    #Aquí busca por fecha 
    #if params[:date].present?
    #  @dogs = @dogs.where("date ILIKE ?", "%#{params[:date]}%")
    #end
    render 'index'
end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = Dog.new(dog_params)

    respond_to do |format|
      if @dog.save
        format.html { redirect_to root_path, notice: 'Dog was successfully created.' }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1
  # PATCH/PUT /dogs/1.json
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog, notice: 'Dog was successfully updated.' }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to dogs_url, notice: 'Dog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:name, :gender, :raza_id, :latitude, :longitude, :dateFound, :dateLost, :characteristics, :collar, :reward, :photo, :user_found_id, :user_lost_id)
    end
end
