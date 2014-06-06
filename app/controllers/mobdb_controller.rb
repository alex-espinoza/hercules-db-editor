class MobdbController < ApplicationController
  def upload
    database = params[:database]
    
    if !['text/plain', 'application/octet-stream'].include?(database.content_type)
      return redirect_to mob_db_edit_path, alert: 'Please upload either a .conf or .txt mob db file.'
    end

    @mob_data = []

    CSV.foreach(database.path) do |row|
      next if (row.join.include?('/') || row.empty?) 
      @mob_data << row
    end

    redirect_to mob_db_edit_path(@mob_data)
  end

  def edit
  end
end
