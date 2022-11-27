class RequestorsController < ApplicationController
  #before_action :set_requestor, only: %i[ show edit update destroy ],:require_user_logged_in!

  # GET /requestors or /requestors.json
  #helper_method :home_page?
  #def home_page?
  #  false
#end
  def index
    @requestors = Requestor.all
  end

  # GET /requestors/1 or /requestors/1.json
  def show
  end

  # GET /requestors/new
  def new
    @requestor = Requestor.new
  end

  # GET /requestors/1/edit
  def edit
  end

  # POST /requestors or /requestors.json
  def create
    @requestor = Requestor.new(requestor_params)

    respond_to do |format|
      if @requestor.save
       # format.html { redirect_to requestor_url(@requestor), notice: "Requestor was successfully created." }
       format.html { redirect_to root_url, notice: "Requestor was successfully created." }
        format.json { render :show, status: :created, location: @requestor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @requestor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requestors/1 or /requestors/1.json
  def update
    respond_to do |format|
      if @requestor.update(requestor_params)
        format.html { redirect_to requestor_url(@requestor), notice: "Requestor was successfully updated." }
        format.json { render :show, status: :ok, location: @requestor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @requestor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requestors/1 or /requestors/1.json
  def destroy
    @requestor.destroy

    respond_to do |format|
      format.html { redirect_to requestors_url, notice: "Requestor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requestor
      @requestor = Requestor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def requestor_params
      params.require(:requestor).permit(:emailId, :password, :password_confirmation, :requestIds)
    end
end
