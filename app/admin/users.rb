ActiveAdmin.register User do
	index do
	    selectable_column
	    id_column
	    column :email
	    column :created_at
	   
	    actions
  end
end