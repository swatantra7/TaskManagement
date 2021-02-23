class WorksController < ApplicationController

  PER_PAGE = 10

  before_action :find_works
  before_action :find_work, only: [:edit, :update, :show]

  def index
    @works = @works.order(updated_at: :desc)
    respond_to do |format|
      format.html do
        @works = @works.paginate(page: params[:page], per_page: PER_PAGE)
      end
    end
  end

  def new
    @work = @works.new
    render_modal('new')
  end

  def create
    @work = @works.new(works_params)
    if @work.save
      flash[:notice] = "Task created successfully"
      xhr_redirect_to redirect_to: works_path
    else
      render_modal('new')
    end
  end

  def update
    if @work.update_attributes(works_params)
      flash[:notice] = "Work updated successfully"
      xhr_redirect_to redirect_to: works_path
    else
      render_modal 'edit'
    end
  end

  def edit
    render_modal('edit')
  end

  def show
    render_modal('show', {:class=>'right'})
  end

  private

  def find_works
    @works = current_user.works.includes(:status, :user)
  end

  def find_work
    @work = @works.find_by(id: params[:id])
  end

  def works_params
    params.require(:work).permit(
      :name,
      :status_id,
      :deadline
    )
  end


end
