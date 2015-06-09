class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
    @user = User.find_by_watiam(session[:cas_user])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meetings }
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = Meeting.find(params[:id])
    @user = User.find_by_watiam(session[:cas_user])

    @allattendees = Attendee.where(:meeting_id => @meeting.id).all
    @allattendees.find(:sort => 'weight')
    @allusers = []
    
    
    #creates array of users that are attending the meeting
    @allattendees.each do |attendee|
      @userall = User.find(:first, :conditions => {:id => attendee.user_id})
      @allusers << @userall
    end
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    @meeting = Meeting.new
    @all = User.all
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
    @all = User.all   

    respond_to do |format|
      if @meeting.save
#         @allattendees = Attendee.destroy_all(:meeting_id => @meeting.id)
#        @alldiscussions = Discussion.destroy_all(:meeting_id => @meeting.id)
         
        
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render json: @meeting, status: :created, location: @meeting }
        
      else
        format.html { render action: "new" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(params[:meeting])
    @user = User.find_by_watiam(session[:cas_user])
    @meeting.user_id = @user.id
    @all = User.all

    respond_to do |format|
      if @meeting.save
        
        AgendaReminder.reminder_email(@user, @meeting).deliver
        
        if params[:all?] == true
          @all.each do |id|
            @a = Attendee.new
            @d = Discussion.new
            @a.meeting_id = @meeting.id
            @a.user_id = id
            @d.meeting_id = @meeting.id
            @d.user_id = id
            @a.weight = @a.user_id
            @a.save
            @d.save
          end
        else 
          params[:user_ids].each do |id|
            @a = Attendee.new
            @d = Discussion.new
            @a.meeting_id = @meeting.id
            @a.user_id = id
            @d.meeting_id = @meeting.id
            @d.user_id = id
            @a.weight = @a.user_id
            @a.save
            @d.save
          end
        end
        
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render json: @meeting, status: :created, location: @meeting }
        
      else
        format.html { render action: "new" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.json
  def update
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to meetings_url }
      format.json { head :no_content }
    end
  end
end
