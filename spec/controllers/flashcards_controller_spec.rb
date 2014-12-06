require "rails_helper"

RSpec.describe FlashcardsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe "GET #show" do
    it "returns a flashcard" do
      flashcard = FactoryGirl.create(:flashcard, user: user)

      get :show, { id: flashcard.id }, { user_id: user.id }

      expect(response.status).to be(200)
      expect(assigns(:flashcard)).to eq(flashcard)
    end
  end

  describe "GET #new" do
    it "initializes a new flashcard" do
      get :new, {}, { user_id: user.id }

      expect(response.status).to be(200)
      expect(assigns(:flashcard)).to be_a(Flashcard)
    end
  end

  describe "POST #create" do
    it "creates a flashcard" do
      post :create, { flashcard: { question: "Hello?", answer: "Hello!" } }, { user_id: user.id }

      expect(assigns(:flashcard).question).to eq("Hello?")
    end
  end

  describe "PUT #update" do
    it "updates a flashcard" do
      flashcard = FactoryGirl.create(:flashcard, user: user)

      put :update, { id: flashcard.id, flashcard: { last_interval: 6, repetitions: 3 } }, { user_id: user.id }

      expect(response.status).to be(200)
      expect(assigns(:flashcard).repetitions).to eq(3)
    end
  end

  describe "DELETE #destroy" do
    it "destroys a flashcard" do
      flashcard = FactoryGirl.create(:flashcard, user: user)

      delete :destroy, { id: flashcard.id }, { user_id: user.id }

      expect(Flashcard.count).to eq(0)
    end
  end
end
