 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/cars", type: :request do
  fixtures :dealerships
  
  # Car. As you add validations to Car, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { model: "Jetta 2021", brand: "VW", description: "a car description", 
    dealership_id: dealerships(:one).id, price: 123456, condition: "new_cars", stock: 500 }
  }

  let(:invalid_attributes) {
    { model: "", brand: "VW", description: "a car description", 
    dealership_id: dealerships(:one).id, price: 123456, condition: "new_cars", stock: 500 }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Car.create! valid_attributes
      get cars_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      car = Car.create! valid_attributes
      get car_url(car)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_car_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      car = Car.create! valid_attributes
      get edit_car_url(car)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Car" do
        expect {
          post cars_url, params: { car: valid_attributes }
        }.to change(Car, :count).by(1)
      end

      it "redirects to the created car" do
        post cars_url, params: { car: valid_attributes }
        expect(response).to redirect_to(car_url(Car.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Car" do
        expect {
          post cars_url, params: { car: invalid_attributes }
        }.to change(Car, :count).by(0)
      end

      it "renders a 422 response unporcessable entity" do
        post cars_url, params: { car: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { model: "Jetta 2021", brand: "VW", description: "a modified car description"}
      }

      it "updates the requested car" do
        car = Car.create! valid_attributes
        patch car_url(car), params: { car: new_attributes }
        car.reload
        expect(car.description).to eq('a modified car description')
      end

      it "redirects to the car" do
        car = Car.create! valid_attributes
        patch car_url(car), params: { car: new_attributes }
        car.reload
        expect(response).to redirect_to(car_url(car))
      end
    end

    context "with invalid parameters" do
      it "renders a 422 response unprocessabel entity" do
        car = Car.create! valid_attributes
        patch car_url(car), params: { car: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested car" do
      car = Car.create! valid_attributes
      expect {
        delete car_url(car)
      }.to change(Car, :count).by(-1)
    end

    it "redirects to the cars list" do
      car = Car.create! valid_attributes
      delete car_url(car)
      expect(response).to redirect_to(cars_url)
    end
  end
end
