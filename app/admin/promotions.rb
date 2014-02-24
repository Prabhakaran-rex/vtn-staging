ActiveAdmin.register Promotion do
  menu :if => proc{ can?(:manage, Promotion) }
  controller.authorize_resource 
	actions :all, :except => [:destroy]
end
