class MobdbController < ApplicationController
  def upload
    database = params[:database]
    
    if !['text/plain', 'application/octet-stream'].include?(database.content_type)
      return render action: 'mob_data', alert: 'Please upload either a .conf or .txt mob db file.'
    end

    @mob_data = []

    CSV.foreach(database.path) do |row|
      next if (row.join.include?('/') || row.empty?) 
      @mob_data << row
    end

    render action: 'mob_data'
  end
end
