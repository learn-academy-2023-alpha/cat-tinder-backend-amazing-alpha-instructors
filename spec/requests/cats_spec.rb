require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do 
      Cat.create(
      name: 'Garfield',
      age: 45,
      enjoys: 'lasagne',
      image: 'https://live.staticflickr.com/7374/27659345390_feda639960_b.jpg')

      # Make a request to the specific endpoint
      get '/cats'

      # We need our response to be in the format of JSON and then we assigned it to a variable
      cat = JSON.parse(response.body)
      # Check that the request has an http status of 200
      expect(response).to have_http_status(200)
      # Check that we are returning the accurate amount of data
      expect(cat.length).to eq 1
    end
  end

  describe "POST / create" do 
    it "creates a cat" do 
      cat_params = {
        cat: {
          name: 'Garfield',
          age: 45,
          enjoys: 'lasagne',
          image: 'https://live.staticflickr.com/7374/27659345390_feda639960_b.jpg'
        }
      }

      # Make a request to the server and pass params 
      post '/cats', params: cat_params 

      # Assure we have a successful response
      expect(response).to have_http_status(200)
      # Look up the cat we expect to be created in the database
      cat = Cat.last 
      # Assure the created cat has the correct attributes
      expect(cat.name).to eq 'Garfield'
      expect(cat.age).to eq 45
      expect(cat.enjoys).to eq 'lasagne'
      expect(cat.image).to eq 'https://live.staticflickr.com/7374/27659345390_feda639960_b.jpg'
    end
  end

  describe "PATCH /update" do 
    it 'updates a cat' do 
      cat_params = {
        cat: {
          name: 'Garfield',
          age: 45,
          enjoys: 'lasagne',
          image: 'https://live.staticflickr.com/7374/27659345390_feda639960_b.jpg'
        }
      }

      post '/cats', params: cat_params 
      cat = Cat.first

      updated_cat_params = {
        cat: {
          name: 'Garfield',
          age: 46,
          enjoys: 'lasagne',
          image: 'https://live.staticflickr.com/7374/27659345390_feda639960_b.jpg'
        }
      }

      patch "/cats/#{cat.id}", params: updated_cat_params

      # Create a variable to store the updated cat by finding the original cat created in this test
      updated_cat = Cat.find(cat.id)
      expect(response).to have_http_status(200)
      expect(updated_cat.age).to eq 46
    end
  end

  describe "DELETE /destroy" do 
    it 'deletes a cat' do 
      cat_params = {
        cat: {
          name: 'Garfield',
          age: 45,
          enjoys: 'lasagne',
          image: 'https://live.staticflickr.com/7374/27659345390_feda639960_b.jpg'
        }
      }
      post '/cats', params: cat_params 
      cat = Cat.first
      cats = Cat.all

      delete "/cats/#{cat.id}"
      expect(response).to have_http_status(200)
      expect(cats).to be_empty
    end
  end
end
