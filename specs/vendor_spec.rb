require_relative 'spec_helper'

describe FarMar::Vendor do
  describe "#initialize" do
    test_vendor = FarMar::Vendor.new(784, "honeybees", 4, 560)

    it "should create a new instance" do
      test_vendor.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "self.all" do
    it "should return a hash of instances, representing all of the objects described in the CSV" do
      FarMar::Vendor.all.must_be_kind_of(Hash)
    end
  end

  # should return an instance of the object where the value of the id field in the CSV matches the passed parameter
  describe "self.find(id)" do
    it "should return true if the passed parameter of through the class method returns an instance that matches the id field in the CSV file" do
      FarMar::Vendor.find(2).id.must_equal(2)
    end
  end

  describe "#market" do
    it "should return True if the correct FarMar::Market instance that is associated with this vendor is outputed using the FarMar::Vendor.market_id field" do
      vendor_9 = FarMar::Vendor.find(9)
      puts vendor_9
      vendor_9.market.id.must_equal(2)
    end
  end

  describe "#products" do
    it "should return a the correct number of FarMar::Product instances that are associated with the vendor instance" do
      product_test = FarMar::Vendor.find(5)
      product_test.products.length.must_equal(3)
    end
  end

  describe "self.by_market(market_id)" do
    it "should return an array of vendors with the given market_id" do
      FarMar::Vendor.by_market(2).must_be_kind_of(Array)
    end

    it "should return True if the correct number of vendors is returned for the given market_id" do
      FarMar::Vendor.by_market(2).length.must_equal(3)
    end
  end

  #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
  describe "#sales" do
    it "should return true if a sample of the collection of FarMar::Sale instances associated with the correct vendor_id field given are the same" do
      sales_test = FarMar::Vendor.find(5)
      sales_test.sales.length.must_equal(9)
    end
  end
end