ActiveAdmin.register Promotion do
  menu :if => proc{ can?(:manage, Promotion) }
	actions :all, :except => [:destroy]
end
