require 'spec_helper'

describe Trip do
  
  let(:admin) { FactoryGirl.create(:admin) }
  before { @trip = admin.trips.build(title: "avg", content: "Lorem ipsum", image: "image.png") }

  subject { @trip }

  it { should respond_to(:image) }
  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == admin }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @trip.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @trip.content = " " }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @trip.title = " " }
    it { should_not be_valid }
  end

  describe "with no image" do
    before { @trip.image = " " }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Trip.new(user_id: admin.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

end
