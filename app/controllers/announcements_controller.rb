class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: %i[ show edit update destroy ]
   # before_action :authenticate_admin!

  # GET /announcements or /announcements.json
  def index
    @announcements = Announcement.all
  end

  # GET /announcements/1 or /announcements/1.json
  def show
  end

  def authenticate_admin!
    unless current_user&.slotbooker == 'media'
      redirect_to home_index_path, alert: "You are not authorized to access this page."
    end
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new
  end

  # GET /announcements/1/edit
  def edit
  end

  # POST /announcements or /announcements.json
  def create
    @announcement = Announcement.new(announcement_params)

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to announcement_url(@announcement), notice: "Announcement was successfully created." }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1 or /announcements/1.json
  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to announcement_url(@announcement), notice: "Announcement was successfully updated." }
        format.json { render :show, status: :ok, location: @announcement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1 or /announcements/1.json
  def destroy
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to announcements_url, notice: "Announcement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def announcement_params
      params.require(:announcement).permit(:heading, :text, :created_on)
    end
end
