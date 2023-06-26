class MainportalController < ApplicationController
#  load_and_authorize_resource :class => false
  # before_action :authenticate_admin!

  def admindashboard
    @today = Date.today
    @internal_count = EquipmentTable.where('DATE(created_at) = ?', @today ).where(role: ['student', 'faculty']).count
    @external_count = EquipmentTable.where('DATE(created_at) = ?', @today ).where(role: 'external').count
    @internal_user = User.where(role: ['student','faculty']).count(:email)
    @external_user = User.where(role: 'external').count(:email)
    @internal_revenue =  EquipmentTable.where(role: ['student', 'faculty']).all
    @external_revenue = EquipmentTable.where(role: 'external').all
    @sum_internal = @internal_revenue.sum(:pay)
    @sum_external = @external_revenue.sum(:pay)
    @internal_booking_count = EquipmentTable.where(role: ['student', 'faculty']).count
    @external_booking_count = EquipmentTable.where(role: 'external').count
    @active_equipments = Equiplist.where(status: 'Active').count
    @under_maintenance = Equiplist.where(status: 'Under Maintenance').count
    @unavailable = Equiplist.where(status: 'Unavailable').count

 end
 def adminModelEquip
   @equiplist=Equiplist.all
  end

#  def authenticate_admin!
#    unless current_user&.admin_role?
#      redirect_to home_index_path, alert: "You are not authorized to access this page."
#    end
#  end
def adminExpress
  @equiplist=Equiplist.all
end
def adminExpSlot
  @equiplist=Equiplist.all
  @equipment_id = params[:equipment_id]
  @equipment = Equiplist.find_by(id: @equipment_id)
  if request.post?
    @equiplist_entry = Equiplist.find_or_initialize_by(name: @equipment.name)
    @equiplist_entry.expressslot = params[:equiplist][:expressslot]
    @equiplist_entry.expressstart = params[:equiplist][:expressstart]
    @equiplist_entry.expressend = params[:equiplist][:expressend]

    if @equiplist_entry.save
      redirect_to mainportal_adminExpress_path
    else
      @errors = @equiplist_entry.errors.full_messages
    end
  else
    render 'adminExpSlot'
  end
end

  def adminModelUsers
    @user = User.all
  end
  def adminModelUsers
      @user = User.all
      @entry = params[:entry]
  end

  def adminStats
      @internal = User.where(role: ['student','faculty']).count(:email)
      @external = User.where(role: 'external').count(:email)
      @ai_engineering = User.where(department: 'AI Engineering').count(:email)
      @chemical_engineering = User.where(department: 'Chemical Engineering').count(:email)
      @chemistry = User.where(department: 'Chemistry').count(:email)
      @civil_engineering = User.where(department: 'Civil Engineering').count(:email)
      @cs_engineering = User.where(department: 'CS Engineering').count(:email)
      @ee_engineering = User.where(department: 'EE Engineering').count(:email)
      @ec_engineering = User.where(department: 'EC Engineering').count(:email)
      @it_engineering = User.where(department: 'IT Engineering').count(:email)
      @mechanical_engineering = User.where(department: 'Mechanical Engineering').count(:email)
      @mining_engineering = User.where(department: 'Mining Engineering').count(:email)
      @metallurgical_engineering = User.where(department: 'Metallurgical Engineering').count(:email)
      @physics = User.where(department: 'Physics').count(:email)
      @water_resources_ocean_engineering = User.where(department: 'Water Resources & Ocean Engineering').count(:email)
  end
  def adminModelEquipWeeks
    Equiplist.where(week_1: nil).update_all(week_1: 'active')
    Equiplist.where(week_2: nil).update_all(week_2: 'active')
    Equiplist.where(week_3: nil).update_all(week_3: 'active')
    Equiplist.where(week_4: nil).update_all(week_4: 'active')
    Equiplist.where(week_5: nil).update_all(week_5: 'active')
    @equiplist=Equiplist.all
   end


   def chairmanStats
     @entry = params[:entry]
     @internal = User.where(role: ['student','faculty']).count(:email)
     @external = User.where(role: 'external').count(:email)
     @ai_engineering = User.where(department: 'AI Engineering').count(:email)
     @chemical_engineering = User.where(department: 'Chemical Engineering').count(:email)
     @chemistry = User.where(department: 'Chemistry').count(:email)
     @civil_engineering = User.where(department: 'Civil Engineering').count(:email)
     @cs_engineering = User.where(department: 'CS Engineering').count(:email)
     @ee_engineering = User.where(department: 'EE Engineering').count(:email)
     @ec_engineering = User.where(department: 'EC Engineering').count(:email)
     @it_engineering = User.where(department: 'IT Engineering').count(:email)
     @mechanical_engineering = User.where(department: 'Mechanical Engineering').count(:email)
     @mining_engineering = User.where(department: 'Mining Engineering').count(:email)
     @metallurgical_engineering = User.where(department: 'Metallurgical Engineering').count(:email)
     @physics = User.where(department: 'Physics').count(:email)
     @water_resources_ocean_engineering = User.where(department: 'Water Resources & Ocean Engineering').count(:email)

   end

   def chairmanStatsPayment
     @entry = params[:entry]
   end

   def chairmanDashboard
        @today = Date.today
        @internal_count = EquipmentTable.where('DATE(created_at) = ?', @today ).where(role: ['student', 'faculty']).count
        @external_count = EquipmentTable.where('DATE(created_at) = ?', @today ).where(role: 'external').count
        @internal_revenue_day =  EquipmentTable.where('DATE(created_at) = ?', @today ).where(role: ['student', 'faculty']).all
        @external_revenue_day = EquipmentTable.where('DATE(created_at) = ?', @today ).where(role: 'external').all
        @sum_internal_day = @internal_revenue_day.sum(:pay)
        @sum_external_day = @external_revenue_day.sum(:pay)
        @internal_user = User.where(role: ['student','faculty']).count(:email)
        @external_user = User.where(role: 'external').count(:email)
        @internal_revenue =  EquipmentTable.where(role: ['student', 'faculty']).all
        @external_revenue = EquipmentTable.where(role: 'external').all
        @sum_internal = @internal_revenue.sum(:pay)
        @sum_external = @external_revenue.sum(:pay)
        @internal_booking_count = EquipmentTable.where(role: ['student', 'faculty']).count
        @external_booking_count = EquipmentTable.where(role: 'external').count
        @active_equipments = Equiplist.where(status: 'Active').count
        @under_maintenance = Equiplist.where(status: 'Under Maintenance').count
        @unavailable = Equiplist.where(status: 'Unavailable').count
        end

   def chairmanStatsSamples
     @entry = params[:entry]
   end

   def chairmanUsers
     @user = User.all
   end

   def chairmanEquip
     @equiplist=Equiplist.all
    end



end
