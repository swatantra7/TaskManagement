class ApplicationController < ActionController::Base

  def render_modal(partial, options = {backdrop: true, keyboard: true})
    render partial: 'shared/modal', locals: { partial: partial, options: options}
  end

  def xhr_redirect_to(args)
    @args = args
    flash.keep
    render 'shared/xhr_redirect_to'
  end

end
