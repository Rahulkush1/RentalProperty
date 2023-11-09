ActiveAdmin.register Property do
	 permit_params :blob_id, :created_at, :id, :name, :record_id, :record_type,:user_id, :status, :price, :prop_type, :publish, :is_paid
	 filter :name
	 scope :all, default: true
	 scope('is Paid'){ |scope| scope.where(is_paid: true) }
	 scope('Sold'){ |scope| scope.where(status: "sold") }


	index do
	 	selectable_column
	 	column :id 
	 	column :name 
	 	column :price 
	 	column :prop_type
	 	column :status
	 	column :is_paid
	 	column "Posted By" do |property|
	 		property.user
	 	end
	 	column "User Type" do |property|
	 		property.user.roles
	 	end
	end

	form title: 'New Property' do |f|
	    f.inputs 'Details' do
		    f.input :user, :as => :select, :collection => User.all.collect { |user| user.id }
		    f.input :name
		    f.input :status
		    f.input :price
		    f.input :prop_type
	      	f.input :amenities, :as => :check_boxes, :collection => Amenity.all.collect {|amenity| [amenity.title, amenity.id] }
		    f.input :publish
		    f.input :is_paid
	    end
	    f.actions
	end
end