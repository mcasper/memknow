module RSpec
  module Support
    module ControllerHelpers
      def setup_user
        FactoryGirl.create(:user)
      end

      def authenticate(user)
        controller.instance_variable_set(:@user, user)
        allow(controller).to receive(:current_user) { user }
      end
    end
  end
end
