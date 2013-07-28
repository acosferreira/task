require 'spec_helper'

describe TypeTasksController do
login_user
 before(:each) do
	 @TypeTask1= TypeTask.create(:name=>'payment')
	 @TypeTask2= TypeTask.create(:name=>'travel')
	 @job = Job.create(:name=>'job', :effort=>3, :user_id=>@user.id, :status=>false, :type_task_id=>@TypeTask1.id)
	 
 end

context "index" do
  before(:each) do
  	get :index
  end
  it "should return list of TypeTask" do
  	assigns(:type_tasks).should_not==[]
  	assigns(:type_tasks).should == [@TypeTask1,  @TypeTask2]
  end
end

context "show" do
  it "should return the item desired" do
  	get :show, :id=>@TypeTask1.id
  	assigns(:type_task).should_not==[@TypeTask2]
  	assigns(:type_task).should == @TypeTask1
  end
end

context "edit" do
  it "should get update item" do
  	get :edit, :id => @TypeTask1.id
    assigns(:type_task).should ==@TypeTask1
  end
end

context "update" do
  it "should update item" do
	  put :update, {:id => @TypeTask1.id, :type_task => {:name=>"weekly"}}
    assigns(:type_task).name.should == "weekly"
  end
  it "should update item" do
	  put :update, {:id => @TypeTask1.id, :type_task => {:name=>nil}}
    @TypeTask1.name.should_not be_nil
  end


end

context "delete" do
	
    it "should alert not possible delete" do
      delete :destroy, :id =>@TypeTask1.id
      flash[:alert].should == "Type task can't be deleted."
    end
    it "should alert success" do
      delete :destroy, :id =>@TypeTask2.id
      flash[:notice].should == "Type task was successfully deleted."
    end
    
end

context "new" do
  it "should create new instace from TypeTask" do
    get :new, {}
    assigns(:type_task).should be_a_new(TypeTask)
  end
end

context "create" do
  it "should create item" do
    expect {
          post :create, {:type_task =>{:name=>"Home Work"} }
        }.to change(TypeTask, :count).by(1)
  end
  it "should not create item" do
    expect {
          post :create, {:type_task =>{:name=>nil} }
        }.to change(TypeTask, :count).by(0)
  end
end



end
