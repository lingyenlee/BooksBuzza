class ListingsController < ApplicationController

    before_action :authenticate_user!
    layout "listing"
    before_action :set_listing, only: [:edit, :update, :destroy]

    def index
        @listings = Listing.all
        @search = Listing.ransack(params[:q])
       @listings = @search.result(distinct: true)
    end

    def user_listings
        @listings = Listing.where("user_id = ?", params[:id]) 
    end

    def new
        set_categories_conditions
        @listing = Listing.new
    end

    def create        
        @listing = current_user.listings.create(listing_params)
       
        if @listing.errors.any? #if errors exist 
            set_categories_conditions
            render "new" #render the "new.html" view  
        else 
            # if no error redirect to the index page showing all listing
            flash[:notice] = "Listing created successfully!"
            redirect_to listings_path
        end
    end

    def edit
         set_categories_conditions
    end

    def update
        save the object
        if @listing.update_attributes(listing_params)
            # if save succeeds redirect to the show section
            flash[:notice] = "Listing updated successfully."
            redirect_to listings_path
        else
        # if save fails, redisplay the form so user can fix problems
            render("edit")
        end
    end

    def destroy
        @listing.destroy
        flash[:notice] = "The listing '#{@listing.title}' deleted successfully."
        redirect_to(listings_path)
    end

    private

    def listing_params
        params.require(:listing).permit(:author, :title, :price, :condition_id, :note, :picture, :id, category_ids: [])  
    end

     #set values for dropdown menus/radio buttons
    def set_categories_conditions
        @categories =  Category.all
        @conditions = Condition.all
    end

    # pass id params into methods
    def set_listing
        @listing = Listing.find(params[:id])
    end
    

end