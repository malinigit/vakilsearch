class FindlawyerController < ApplicationController
  
  def index
  
  end

  def list
    
    @check = Citylist.new(citylist_params)
   
    @lists= Citylist.joins("INNER JOIN servicelists on citylists.code = servicelists.code ").where(" citylists.location = ? and servicelists.servicename = ?",session[:location],@check.name).select("citylists.name,citylists.exp,citylists.rating,servicelists.servicecode,servicelists.charges")

  end 

  def show
  	
    session[:location] = ''
    
    @city = Citylist.new

  	@obj = Citylist.select(:location).distinct(:location).order(:location)
    
    @obj1 = Servicelist.joins("INNER JOIN citylists on citylists.code = servicelists.code").select(:servicename).where("citylists.location = ?",params[:id])
  
  end

  def search
    
    @city = Citylist.new
  	
    @check = Citylist.new(citylist_params)
    
    @obj = Citylist.select(:location).distinct(:location).order(:location)
  	
    session[:location] = @check.location
	
    @obj1 = Servicelist.joins("INNER JOIN citylists on citylists.code = servicelists.code").select(:servicename).where("citylists.location = ?",session[:location])
	
    render action: 'show', id: @check.location

  end


private

def citylist_params

      params.require(:citylist).permit(:code, :name, :exp, :location, :rating)
	
end

end
