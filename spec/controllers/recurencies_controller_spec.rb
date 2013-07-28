require 'spec_helper'

describe RecurrenciesController do
login_user
 before(:each) do
	 @recurrency1= Recurrency.create(:name=>'Daily')
	 @recurrency2= Recurrency.create(:name=>'Monthly')
	 @job = Job.create(:name=>'job', :effort=>3, :user_id=>@user.id, :status=>false, :recurrency_id=>@recurrency1.id)
	 
 end

context "index" do
  before(:each) do
  	get :index
  end
  it "should return list of tasks from user" do
  	assigns(:recurrencies).should_not==[]
  	assigns(:recurrencies).should == [@recurrency1,  @recurrency2]
  end
end

context "show" do
  it "should return the item desired" do
  	get :show, :id=>@recurrency1.id
  	assigns(:recurrency).should_not==[@recurrency2]
  	assigns(:recurrency).should == @recurrency1
  end
end

context "edit" do
  it "should get update item" do
  	get :edit, :id => @recurrency1.id
    assigns(:recurrency).should ==@recurrency1
  end
end

context "update" do
  it "should update item" do
	  put :update, {:id => @recurrency1.id, :recurrency => {:name=>"weekly"}}
    assigns(:recurrency).name.should == "weekly"
  end
  it "should update item" do
	  put :update, {:id => @recurrency1.id, :job => {:name=>nil}}
    @recurrency1.name.should_not be_nil
  end


end

context "delete" do
	
    it "should alert not possible delete" do
      delete :destroy, :id =>@recurrency1.id
      flash[:alert].should == "Recurrency can't be deleted."
    end
    it "should alert success" do
      delete :destroy, :id =>@recurrency2.id
      flash[:notice].should == "Recurrency was successfully deleted."
    end
    
end

context "new" do
  it "should create new instace from Job" do
    get :new, {}
    assigns(:recurrency).should be_a_new(Recurrency)
  end
end

context "create" do
  it "should create item" do
    expect {
          post :create, {:recurrency =>{:name=>"tasker"} }
        }.to change(Recurrency, :count).by(1)
  end
  it "should not create item" do
    expect {
          post :create, {:job =>{:name=>nil} }
        }.to change(Recurrency, :count).by(0)
  end
end

end
