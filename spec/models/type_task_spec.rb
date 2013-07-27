require 'spec_helper'

describe TypeTask do
 context "create job list" do
  	before(:each) do
  		TypeTask.create(:name=>'type')
  	end
  	
  	it "should return sucess" do
		TypeTask.create(:name=>'type').should be_true
	end  

  	it "should return false, name can't be blank" do
  		 TypeTask.create(:name=>'type').should have(1).error_on(:name)
  	end
  end

   context "validate if is possible delete type" do
  	before(:each) do
  		@type = TypeTask.create(:name=>'Payment')
  		@type2 = TypeTask.create(:name=>'Travel')
  		@main = Job.create(:name=>'Job', :effort=>2, :estimated_date=> Date.today, :type_task_id=>@type.id)
  		
  	end

  	it "should return false" do
  		@type.is_delete_possible?.should be_false
  	end

  	it "should return true" do
  		@type2.is_delete_possible?.should be_true
  	end
  end
end
