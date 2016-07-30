ActiveAdmin.register_page "Strategic Partners" do

  content :title=> "Strategic Partners" do
    columns do
      column do
        table_for appraisals, sortable: true, sortable: true, class: "index_table index", id: "strategic_partner" do
          column("Id", sortable: :id) { |appraisal| appraisal.id}
          column("Name", sortable: :name) { |appraisal| link_to appraisal.name || "Appraisal", admin_appraisal_path(appraisal)}
          column("Created At", sortable: :created_at) { |appraisal| appraisal.created_at}
          column("Status", sortable: :status) { |appraisal| getStringForActivityValue(appraisal.status)}
          column("Primary Contact Name", sortable: :contact_name) { |appraisal| link_to appraisal.owned_by.name, admin_customer_path(appraisal.owned_by)}
          column("Secondary Contact Name", sortable: :secondary_contact_name) { |appraisal| appraisal.owned_by.secondary_contact_name}
          column("Primary Contact Email", sortable: :email) { |appraisal| appraisal.owned_by.email}
          column("Secondary Contact Email", sortable: :secondary_contact_email) { |appraisal| appraisal.owned_by.secondary_contact_email}
          column("Negotiated Cost", sortable: :negotiated_cost) { |appraisal| appraisal.owned_by.negotiated_cost}
          column("Payment Term", sortable: :payment_term) { |appraisal| appraisal.owned_by.payment_term}
          column("Vendor ID", sortable: :vendor_token) { |appraisal| appraisal.owned_by.vendor_token}
          column("Client or adjuster name", sortable: :client_name) { |appraisal| appraisal.partner_informations.length > 0 ? appraisal.partner_informations.last.try(:client_name) : ""}
          column("Address", sortable: :address) { |appraisal| appraisal.partner_informations.length > 0 ? appraisal.partner_informations.last.try(:address) : ""}
          column("City, State, Postal Code", sortable: :city_state_potal) { |appraisal| appraisal.partner_informations.length > 0 ? appraisal.partner_informations.last.try(:city_state_potal) : ""}
          column("Claim or Job Number", sortable: :claim_number) { |appraisal| appraisal.partner_informations.length > 0 ? appraisal.partner_informations.last.try(:claim_number) : ""}
        end

      end
    end
  end

  controller do
    USER_CONSTANT = ["contact_name", "email", "negotiated_cost", "payment_term", "vendor_token", "secondary_contact_name", "secondary_contact_email"]
    PARTNER_INFO = ["client_name", "address", "city_state_potal", "claim_number"]

    def index
      sort = params[:order] || "id_asc"
      sort = sort.reverse.sub!("_", " ").reverse
      users = User.where(is_partner: true, type: "Customer")

      if USER_CONSTANT.include?(sort.split(" ")[0])
        sort = sort.gsub("contact_", "users.") if sort.split(" ")[0] == "contact_name"
        @appraisals =  Appraisal.includes(:owned_by).where(created_by: users).order(sort)
      elsif PARTNER_INFO.include?(sort.split(" ")[0])
        @appraisals =  Appraisal.includes(:partner_informations).where(created_by: users).order(sort)
      else
        @appraisals = Appraisal.where(created_by: users).order(sort)
      end 

    end

  end



end











# ActiveAdmin.register_page "Strategic Partners" do

#   content :title=> "Strategic Partners" do
#     columns do
#       column do
#         table_for users, sortable: true, class: "index_table index", id: "strategic_partner" do
#           column("Id", sortable: :id) { |user| link_to user.id, admin_customer_path(user.id, flag: "true") }   
#           column :email
#           column :name
#           column("Primary Phone", sortable: :phone1) {|user| user.address.phone1 }
#           column("Secondary Phone", sortable: :phone2) {|user| user.address.phone2 }
#           column("Address", sortable: :address) {|user| user.address.address }
#           column :vendor_token

          
#           # column("Appraisals") { |user|
#           #   Appraisal.where(created_by: user).each do |rs|
#           #     name = rs.name || "Appraisal"
#           #     li link_to name, admin_appraisal_path(rs.id) 
#           #   end
#           # }
          

#           column "Partner Pricing" do |user|
#             link_to "View", admin_partner_pricing_path(PartnerPricing.find_by_user_id(user).id) unless PartnerPricing.find_by_user_id(user).blank?

#             # link_to "Edit", edit_admin_partner_pricing_path(PartnerPricing.find_by_user_id(user).id) unless PartnerPricing.find_by_user_id(user).blank?
#           end
#         end

#       end
#     end
#   end



#   controller do
#     CONSTANT = ["phone1", "phone2", "address"]

#     def index
#       sort = params[:order] || "id_asc"
#       unless CONSTANT.include?(sort.split("_")[0])
#         @users = User.where(is_partner: true, type: "Customer").order(sort.reverse.sub!("_", " ").reverse)
#       else
#         @users = User.where(is_partner: true, type: "Customer").joins(:address).order(sort.reverse.sub!("_", " ").reverse)
#       end
#     end
#   end





# end