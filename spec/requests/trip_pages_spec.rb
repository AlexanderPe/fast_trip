require 'spec_helper'

describe "Trips pages" do

	subject { page }

  describe "home" do

    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      sign_in user
      visit root_path
    end

    it { should_not have_link('delete') }
    it { should_not have_link('edit') }
    it { should have_selector('title', text: 'fast trip') }

    describe "delete links" do

      describe "as an admin user" do

        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_out user
          sign_in admin
          visit root_path
        end

        describe "trip creation" do
          before { visit new_trip_path }

          describe "with invalid information" do

          it "should not create a trip" do
            expect { click_button "Create" }.not_to change(Trip, :count)
          end

          describe "error messages" do
            before { click_button "Create" }
            it { should have_content('error') }
            end
          end

          describe "with valid information" do

            before do 
              fill_in 'Title', with: "avg"
              fill_in 'Content', with: "Lorem ipsum"
              fill_in 'Image', with: "image.png"
            end

            it "should create a trip" do
              expect { click_button "Create" }.to change(Trip, :count).by(1)
            end
          end
        end
      end
    end    
  end
end