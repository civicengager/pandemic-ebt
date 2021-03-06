require 'rails_helper'

RSpec.feature "Eligibility page", type: :feature do
  describe "Chooses no" do
    it "should show the Sorry page" do
      visit "/steps/eligible"
      expect(page).to have_text "Is your child able to receive free or reduced price meals"
      choose "No"
      click_on "Continue"
      expect(page).to have_text "This program is only for children who can get free and reduced price school meals"
    end
  end

  describe "Chooses I don't know" do
    it "should show the meal eligibility page and a link to take you back" do
      visit "/steps/eligible"
      expect(page).to have_text "Is your child able to receive free or reduced price meals"
      choose "I don't know"
      click_on "Continue"
      expect(page).to have_text "Who can get free and reduced price school meals?"
      within ".form-card" do
        click_on "Go back"
      end
      expect(page).to have_text "Is your child able to receive free or reduced price meals"
    end
  end
end