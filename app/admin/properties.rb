ActiveAdmin.register Property do
 permit_params :blob_id, :created_at, :id, :name, :record_id, :record_type	
 filter :name
end