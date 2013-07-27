require 'spec_helper'

describe Recurrency do
  context "create job list" do
  	before(:each) do
  		Recurrency.create(:name=>'daily')
  	end
  	
  	it "should return sucess" do
		Recurrency.create(:name=>'monthly').should be_true
	end  

  	it "should return false, name can't be blank" do
  		 Recurrency.should have(1).error_on(:name)
  	end
  end

   context "validate if is possible delete type" do
  	before(:each) do
  		@type = Recurrency.create(:name=>'daily')
  		@type2 = TypeTask.create(:name=>'monthly')
  		@main = Job.create(:name=>'Job', :effort=>2, :estimated_date=> Date.today, :recurrency_id=>@type.id)
  		
  	end

  	it "should return false" do
  		@type.is_delete_possible?.should be_false
  	end

  	it "should return true" do
  		@type2.is_delete_possible?.should be_true
  	end
  end
end
