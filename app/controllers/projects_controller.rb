class ProjectsController < ApplicationController

  # GET /projects
  # GET /projects.json
  def index
    @user = User.find_by_id(session[:user_id])
    @projects = @user.projects
    
    #@user.projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @project_ideas = Idea.where("project_id = ?", params[:id])
    @user = User.find(session[:user_id])

    @project_ideas.each do |p_idea|
      if p_idea.ancestor == nil
        @n_id = p_idea.id
        @idea = p_idea
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  #{ render :xml => @users }
      #format.json  { render :file => "index.json.erb", :content_type => 'application/json' }
      format.json #{render :json => @project_ideas}
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    current_user = User.find_by_id(session[:user_id])
    assign_user = User.find_all_by_username(params[:project][:assignuser])

    respond_to do |format|
      if @project.save
        @project.users << current_user
        @project.users << assign_user
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    assign_user = User.find_all_by_username(params[:project][:assignuser])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        @project.users << assign_user
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
