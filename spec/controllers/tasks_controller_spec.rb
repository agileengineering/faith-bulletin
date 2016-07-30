require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it 'loads a list of tasks into @tasks' do
      task_1 = create(:task)
      task_2 = create(:task)
      task_3 = create(:task)

      get :index

      expect(assigns(:tasks).length).to eq(3)
      expect(assigns(:tasks)).to include(task_1)
      expect(assigns(:tasks)).to include(task_2)
      expect(assigns(:tasks)).to include(task_3)
    end
  end
end

