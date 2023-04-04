require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name" do 
    cat = Cat.create(age: 20, enjoys: 'fish', image: 'https://static.wikia.nocookie.net/heathcliff/images/b/b8/Heathcliff_promotional.png/revision/latest?cb=20210522181311g')
    expect(cat.errors[:name]).to_not be_empty
    expect(cat.errors[:name]).to include "can't be blank"
  end

  it "should have an age" do 
    cat = Cat.create(name: 'Heathcliff', enjoys: 'fish', image: 'https://static.wikia.nocookie.net/heathcliff/images/b/b8/Heathcliff_promotional.png/revision/latest?cb=20210522181311g')
    expect(cat.errors[:age]).to_not be_empty
    expect(cat.errors[:age].length).to eq 1
  end

  it "should enjoy something" do 
    cat = Cat.create(name: 'Heathcliff', age: 20, image: 'https://static.wikia.nocookie.net/heathcliff/images/b/b8/Heathcliff_promotional.png/revision/latest?cb=20210522181311g')
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "should have an image" do 
    cat = Cat.create(name: 'Heathcliff', age: 20, enjoys: 'fish')
    expect(cat.errors[:image]).to_not be_empty
  end
end
