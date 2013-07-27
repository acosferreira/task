require 'spec_helper'

describe JobsController do
	login_user
 before(:each) do
	 	@main = Job.create(:name=>'job', :effort=>3, :user_id=>@user.id, :status=>false)
	 	@child = Job.create(:name=> 'child', :job_id=>@main.id, :effort=>3,:user_id=>@user.id,:status=>false,:estimated_date=> Date.today-1)
 end

context "index" do
  before(:each) do
  	get :index
  end
  it "should return list of tasks from user" do
  	assigns(:jobs).should_not==[]
  	assigns(:jobs).should == [@main]
  end

  it "should return conditions to collection" do
	controller.send(:conditions_to_collection).should == ["job_id is null and status = ?  and user_id = ?", false, 1]
  end
end

context "show" do
  it "should return the item desired" do
  	get :show, :id=>@main.id
  	assigns(:job).should_not==[@main]
  	assigns(:jobs).should == [@child]
  end
end

context "edit" do
  it "should get update item" do
  	get :edit, :id => @main.id
    assigns(:job).should ==@main
  end
end

context "update" do
  it "should update item" do
	put :update, {:id => @main.id, :job => {:name=>"task"}}
    assigns(:job).name.should == "task"
  end
  it "should update item" do
	put :update, {:id => @main.id, :job => {:effort=>nil}}
    flash[:alert].should == "Job can't be deleted."
  end


end

context "delete" do
	
    it "should alert not possible delete" do
      delete :destroy, :id =>@main.id
      flash[:alert].should == "Job can't be deleted."
    end
    it "should alert success" do
      delete :destroy, :id =>@child.id
      flash[:notice].should == "Job was successfully deleted."
    end
    
end

context "reminder tasks" do
  it "should return list to reminder" do
  	get :reminder_tasks
	assigns(:jobs).should == [@child]
  end
 
end

context "create" do
  it "should create item"
end

end
