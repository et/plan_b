DummyApp::Application.routes.draw do
  mount PlanB::Engine => '/plan_b'
  root to: redirect("http://google.com")
end
