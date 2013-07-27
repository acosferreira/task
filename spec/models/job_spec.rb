require 'spec_helper'

describe Job do
  context "create job list" do
  	before(:each) do
  		Job.create(:name=>'Job', :effort=>2, :estimated_date=> Date.today)
  	end
  	
  	it "should return sucess" do
		Job.create(:name=>'Job list', :effort=>2, :estimated_date=> Date.today).should be_true
	end  

  	it "should return false, name can't be blank" do
  		 Job.should have(1).error_on(:name)
  	end

  	it "should return false, effort can't be blank" do
  		Job.should have(1).error_on(:effort)
  	end
  	it "should return false, alredy exists"
  end

  context "validate if is possible delete a list" do
  	before(:each) do
  		@main = Job.create(:name=>'Job', :effort=>2, :estimated_date=> Date.today)
  		@child = Job.create(:name=>'Job child', :effort=>2, :estimated_date=> Date.today, :job_id=>@main.id)
  	end

  	it "should return false" do
  		@main.is_delete_possible?.should be_false
  	end

  	it "should return true" do
  		@child.is_delete_possible?.should be_true
  	end
  end

  context "Validate main job" do
    before(:each) do
  		@main = Job.create(:name=>'Job', :effort=>2, :estimated_date=> Date.today)
  		@child = Job.create(:name=>'Job child', :effort=>2, :estimated_date=> Date.today, :job_id=>@main.id)
  	end
  	it "should return true to main" do
  		@main.is_main?.should be_true
  	end
  		
  	it "should return false to child" do
  		@child.is_main?.should be_false
  	end
  end
  
  context "Validate main job" do
    before(:each) do
  		@main = Job.create(:name=>'Job', :effort=>2, :estimated_date=> Date.today)
  		@child = Job.create(:name=>'Job child', :effort=>2, :estimated_date=> Date.today, :job_id=>@main.id)
  	end
  	it "should return true to main" do
  		@main.has_child?.should be_true
  	end
  end

  context "Reminder" do
    before(:each) do
  		@main = Job.create(:name=>'Job', :effort=>2, :estimated_date=> Date.today-1, :user_id=>1)
  		@child = Job.create(:name=>'Job child', :effort=>2, :estimated_date=> Date.today-1, :job_id=>@main.id,:user_id=>1)
  	end
  	it "should return true to main" do
  		Job.reminder_pending_tasks(1).should_not == ""
  	end
  end

 context "Set Status" do
    before(:each) do
  		@main = Job.create(:name=>'Job', :effort=>2, :estimated_date=> Date.today-1, :user_id=>1)
  		@child = Job.create(:name=>'Job child', :effort=>2, :estimated_date=> Date.today-1, :job_id=>@main.id,:user_id=>1)
  		@child1 = Job.create(:name=>'Job child1', :effort=>2, :estimated_date=> Date.today-1, :job_id=>@main.id,:user_id=>1)
  		@child2 = Job.create(:name=>'Job child2', :effort=>2, :estimated_date=> Date.today-1, :job_id=>@main.id,:user_id=>1)
  		
  	end
  	it "should return true to main" do
  		@main.status=true
  		@main.save
		#@child.status.should be_true
  	end
  end


end
