# == Schema Information
#
# Table name: timekeepings
#
#  id         :integer          not null, primary key
#  clock_in   :datetime
#  clock_out  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class TimekeepingsController < ApplicationController
  # User this action to see if a user is authenticated!
  before_action :authenticate_user!
  before_action :set_timekeeping, only: [:show, :edit, :update, :destroy]

  # GET /timekeepings
  # GET /timekeepings.json
  def index
    @timekeepings = Timekeeping.all
  end

  # GET /timekeepings/1
  # GET /timekeepings/1.json
  def show
  end

  # GET /timekeepings/new
  def new
	@last_record = Timekeeping.last
	#@project_list = current_user.get_project_ids
	#Check if the user has any records
  if (!@last_record.nil?)&&(@last_record.clock_out.nil?)
	  render '_clock_out_form'
  else
    # define projects, you can also do this in the view if you want
    @projects = current_user.projects
    @timekeeping = Timekeeping.new
	  render '_clock_in_form'
  end
  end


  # GET /timekeepings/1/edit
  def edit
  end

  def clock_in
	@timekeeping = Timekeeping.new
	@timekeeping.clock_in = DateTime.current
  # Not sure if you want to assign the user to the timekeeping here or in create? Maybe you want to do it here incase someone else wants to create a timekeeping for another user for some reason?
  @timekeeping.user = current_user.id
  puts @timekeeping
    respond_to do |format|
      if @timekeeping.save
        format.html { redirect_to @timekeeping, notice: 'Timekeeping was successfully created.' }
        format.json { render :show, status: :created, location: @timekeeping }
      else
        format.html { render :new }
        format.json { render json: @timekeeping.errors, status: :unprocessable_entity }
      end
    end
  end

def clock_out
	@last_record = Timekeeping.last
	@last_record.clock_out = DateTime.current
    respond_to do |format|
      if @last_record.save
        format.html { redirect_to @last_record, notice: 'Timekeeping was successfully created.' }
        format.json { render :show, status: :created, location: @last_record }
      else
        format.html { render :new }
        format.json { render json: @last_record.errors, status: :unprocessable_entity }
      end
    end
 end

  # POST /timekeepings
  # POST /timekeepings.json
  def create
    #@timekeeping = Timekeeping.new(timekeeping_params)
	@timekeeping = Timekeeping.new
	@timekeeping.clock_in = DateTime.current
  # This seems nasty... might think of a better way to do this
  @timekeeping.project_id = timekeeping_params[:project_id]
  @timekeeping.user = current_user
  # Tie user to timekeeping
    respond_to do |format|
      if @timekeeping.save
        format.html { redirect_to @timekeeping, notice: 'Timekeeping was successfully created.' }
        format.json { render :show, status: :created, location: @timekeeping }
      else
        puts @timekeeping.errors.to_yaml
        format.html { render :new }
        format.json { render json: @timekeeping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timekeepings/1
  # PATCH/PUT /timekeepings/1.json
  def update
    respond_to do |format|
      if @timekeeping.update(timekeeping_params)
        format.html { redirect_to @timekeeping, notice: 'Timekeeping was successfully updated.' }
        format.json { render :show, status: :ok, location: @timekeeping }
      else
        format.html { render :edit }
        format.json { render json: @timekeeping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timekeepings/1
  # DELETE /timekeepings/1.json
  def destroy
    @timekeeping.destroy
    respond_to do |format|
      format.html { redirect_to timekeepings_url, notice: 'Timekeeping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timekeeping
      @timekeeping = Timekeeping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timekeeping_params
      params.require(:timekeeping).permit(:clock_in, :clock_out, :project_id)
    end
end
