require 'rails_helper'

RSpec.describe Api::V1::Admin::SlackAppWithChannelsController, type: :controller do
  describe "Slack connect", autodoc: true do
    let(:admin_account) { create(:admin_account) }
    let(:auth_headers) { admin_account.create_new_auth_token }
    
    before do
      @request.env["devise.mapping"] = Devise.mappings[:api_v1_admin_admin]
      @request.headers.merge!(auth_headers)
    end

    context "get button" do
      it "get button success" do
        get :button_install_channel
        expect(response.status).to eq(200)
        expect(json["success"]).to eq(true)
        expect(json["url"]).not_to be_nil
      end
    end

    context "callback" do
      WebMock.allow_net_connect!
      it "fail callback" do
        get :callback, params: {code: "1234" }
        expect(json["success"]).to eq(false)
        expect(json["data"]).to be_nil
      end
    end
    
  end
end
