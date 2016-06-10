class DogsController < ApplicationController
  before_action :authenticate_user!, :except => [:search]
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  

  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.all
  end

  def map_data
    @dogs = Dog.all
    render json:{dogs: @dogs}
  end

def search
  @dogs = Dog.order("date DESC")
  @lostFound = params["lostFound"]
  if params["lostFound"]=="true" 
      @dogs=@dogs.where(lostFound: true) 
  elsif params["lostFound"]=="false" 
      @dogs=@dogs.where(lostFound: false) 
  end

    #Se filtran los tres
    if params[:date].present? & params[:raza_id].present? & params[:gender].present?
         @dogs = Dog.where(date: params[:date],raza_id: params[:raza_id], gender: params[:gender])
    elsif params[:date].present? & params[:raza_id].present?
         @dogs = Dog.where(date: params[:date],raza_id: params[:raza_id])
    elsif params[:date].present? & params[:gender].present?
         @dogs = Dog.where(date: params[:date],gender: params[:gender])
    elsif params[:raza_id].present? & params[:gender].present?
          @dogs = Dog.where(raza_id: params[:raza_id], gender: params[:gender])
    elsif params[:date].present?
         @dogs = Dog.where(date: params[:date])   
    elsif params[:raza_id].present? 
      @dogs = @dogs.where(raza_id: params[:raza_id])
    elsif params[:gender].present?
      @dogs = @dogs.where(gender: params[:gender])
    end
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
    @dog.user_found_id = current_user.id

    respond_to do |format|
      if @dog.save 
        if @dog.lostFound == true
          format.html {redirect_to "/dogs/search?lostFound=true", notice: 'Dog was successfully created.' }
        else
          format.html {redirect_to "/dogs/search?lostFound=false", notice: 'Dog was successfully created.' }
        end
        #format.html { redirect_to root_path, notice: 'Dog was successfully created.' }
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
      params.require(:dog).permit(:name, :gender, :raza_id, :latitude, :longitude, :date, :characteristics, :collar, :reward, :photo, :user_found_id, :user_lost_id, :calle, :numero, :colonia, :ciudad, :pais, :codigoPostal, :lostFound)
    end
end
