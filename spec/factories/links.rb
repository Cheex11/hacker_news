
FactoryGirl.define do
  factory :link do
    url "http://wwww.example.com"
    title "Basic Webpage"
    score 1

    factory :link_with_score_10  do
      score 10
    end

    factory :link_with_score_20 do
      score 20
    end
  end
end
