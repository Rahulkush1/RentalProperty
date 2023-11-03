ActiveAdmin.register User do
	filter :first_name
	index do
	    selectable_column
	    id_column
	    column :email
	    column :created_at
	   
	    actions
  end
end