class MobdbController < ApplicationController
  def upload
    database = params[:database]
    
    if !['text/plain', 'application/octet-stream'].include?(database.content_type)
      return redirect_to mob_db_edit_path, alert: 'Please upload either a .conf or .txt mob db file.'
    end

    redirect_to mob_db_edit_path
  end

  def edit
  end
end
