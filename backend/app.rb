require 'sinatra'
require 'json'

get '/courses/:lang' do
  content_type :json

  if params['lang'] == 'jp'
    [{ title: '数学 I', desc: '基本代数と関数' }].to_json
  else
    [{ title: 'Math I', desc: 'Basic Algebra and Functions' }].to_json
  end
end
