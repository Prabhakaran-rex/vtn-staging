class SkillsController < ApplicationController
  def index
    @skills = Skill.all

    respond_to do |format|
      format.json { render json: @skills }
    end
  end

  def create
    if params[:skill]['all']
      skills = []
      Category.all.each {|c| skills << c.skills.new(:user_id => params[:skill][:user_id])}
      @result = Skill.import skills
      if @result.failed_instances.empty?
        respond_to {|format| format.json {render :json => current_user.skills.select('skills.id, categories.name').joins(:category)} }
      end
    else
      @skill = Skill.new(params[:skill])
      respond_to do |format|
        if @skill.save
          format.json { render json: @skill, status: :created, location: @skill }
        else
          format.json { render json: @skill.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def getSkillset(user)
    Skill.joins(:categories).where("user_id = ?",user)
  end

  def getRootCategories
    if params[:id]
      @categories = Category.find(params[:id]).children
    else
      @categories = Category.roots.order(:name)
    end
    h = Hash.new
    @categories.each do |c|
      h[c.id] = c.name
    end

    respond_to do |format|
      format.json { render :json => h.to_json}
    end
  end

end
