require "rails_helper"

RSpec.describe FlashcardsController do
  login_user

  describe "GET #show" do
    it "returns a flashcard" do
      flashcard = FactoryGirl.create(:flashcard, user: User.first)

      get :show, id: flashcard.id

      expect(response.status).to be(200)
      expect(assigns(:flashcard)).to eq(flashcard)
    end
  end

  describe "GET #new" do
    it "initializes a new flashcard" do
      get :new

      expect(response.status).to be(200)
      expect(assigns(:flashcard)).to be_a(Flashcard)
    end
  end

  describe "POST #create" do
    it "creates a flashcard" do
      post :create, flashcard: { question: "Hello?", answer: "Hello!" }

      expect(response.status).to be(200)
      expect(assigns(:flashcard).question).to eq("Hello?")
    end
  end

  describe "PUT #update" do
    it "updates a flashcard" do
      flashcard = FactoryGirl.create(:flashcard, user: User.first)

      put :update, id: flashcard.id, flashcard: { last_interval: 6, repetitions: 3 }

      expect(response.status).to be(200)
      expect(assigns(:flashcard).repetitions).to eq(3)
    end
  end

  describe "DELETE #destroy" do
    it "destroys a flashcard" do
      flashcard = FactoryGirl.create(:flashcard, user: User.first)

      delete :destroy, id: flashcard.id

      expect(Flashcard.count).to eq(0)
    end
  end
end
