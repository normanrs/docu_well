# 📱 DocUWell

## Project Objective
This project was created for the 4th module of the backend program at Turing School of Software & Design. This app uses TDD and Ruby on Rails to create API endpoints for a frontend app "DocUWell" to use. The frontend app in production can be found at  <https://myhealthnavigator.herokuapp.com/>. The app was designed to take in and store a user's medical data i.e their appointments, providers, insurance information and prescriptions. 

## ⚙️ Initial Setup
### Running the code locally
1. clone the git repository
2. run `rails s` and visit `localhost:3000/api/v1` to begin interacting with API endpoints

### Backend Production url 

`https://my-health-tracker.herokuapp.com/api/v1`

### 🕹 How to Use

##### Create a User
 * URI: <br>
 `/users`
 * METHOD: <br>
 `POST`
 * DATA PARAMS: <br>
 `email=[string]`
 `password=[string]`
 * DATA RESPONSE: <br>


##### Retrieve a User's API key
 * URI: <br>
 `/users`
 * METHOD: <br>
  `GET`
 * DATA PARAMS: <br>
 `email=[string]`
 `password=[string]`
 * DATA RESPONSE:


##### Create a Provider
 * URI: <br>
 `/providers`
 * METHOD: <br>
  `POST`
 * DATA PARAMS: <br>
 `api_key=[string]`
 `given_name=[string]`
 `surname=[string]`
 `street_address=[string]`
 `city=[string]`
 `state=[string]`
 `zip=[string]`
 `phone=[string]`
 `speciality=[enum]` <br>
 `enum = allergist, anesthesiologist, cardiologist, dentist, dermatologist,
  endocrinologist, general_practitioner, gastroenterologist, geneticist,
  geriatric_specialist, gynecologist, hematologist, internist, massage_therapist,
  naturopath, nephrologist, neurologist, obstetrician, oncologist, ophthalmologist,
  optometrist, osteopath, palliative, pediatrician, podiatrist, psychiatrist,
  pulmonologist, radiologist, rheumatologist, surgeon, urologist`
 * DATA RESPONSE:

##### Retrieve all Providers
 * URI: <br>
 `/providers`
 * METHOD: <br>
  `GET`
 * DATA PARAMS: <br>
 none
 * DATA RESPONSE:

##### Create a Profile for User
 * URI: <br>
 `/profiles`
 * METHOD: <br>
  `POST`
 * DATA PARAMS: <br>
 `api_key=[string]`
 `user_id=[integer]`
 `given_name=[string]`
 `surname=[string]`
 `dob=[unix time]`
 `height=[integer]`
 `weight=[integer]`
 `bp_systolic=[integer]`
 `bp_diastolic=[integer]`
 `heart_rate=[integer]`
 `blood_type=[enum]` <br>
 `enum = o_negative, o_positive, a_negative, a_positive, b_negative, b_positive, ab_negative, ab_positive`
 * DATA RESPONSE:

##### Retrieve a Profile
 * URI: <br>
 `/profiles`
 * METHOD: <br>
  `GET`
 * DATA PARAMS: <br>
 `api_key=[string]`
 * DATA RESPONSE:

##### Edit a Profile
 * URI: <br>
 `/profiles`
 * METHOD: <br>
  `PATCH`
 * DATA PARAMS: <br>
 `api_key=[string]`
 `profile_id=[integer]`
 the profile param to be modified
 * DATA RESPONSE:

##### Create an Insurance
 * URI: <br>
 `/insurances`
 * METHOD: <br>
  `POST`
 * DATA PARAMS: <br>
 `api_key=[string]`
 `profile_id=[integer]`
 `carrier=[string]`
 `group_number=[string]`
 `id_number=[string]`
 `phone_number=[string]`
 `insurance_type=[enum]` <br>
 `enum = medical, dental, vision, supplemental`
 
 * DATA RESPONSE:

##### Retrieve an Insurance
 * URI: <br>
 `/insurances`
 * METHOD: <br>
  `GET`
 * DATA PARAMS: <br>
 `api_key=[string]`
 `profile_id=[integer]`
 
 * DATA RESPONSE:

##### Delete an Insurance
 * URI: <br>
 `/insurances`
 * METHOD: <br>
  `DELETE`
 * DATA PARAMS: <br>
 `api_key=[string]`
 `insurance_id=[integer]`
 
 * DATA RESPONSE:

##### Create an Appointment
 * URI: <br>
 `/appointments`
 * METHOD: <br>
  `POST`
 * DATA PARAMS: <br>
 `api_key=[string]`
 `profile_id=[integer]`
 `provider_id=[integer]`
 `datetime=[unix]`
 * DATA RESPONSE:

##### Retrieve an Appointment
 * URI: <br>
 `/appointments`
 * METHOD: <br>
  `GET`
 * DATA PARAMS: <br>
 `api_key=[string]`
 `profile_id=[integer]`
 
 * DATA RESPONSE:

##### Delete an Appointment
 * URI: <br>
 `/appointments`
 * METHOD: <br>
  `DELETE`
 * DATA PARAMS: <br>
 `api_key=[string]`
 `profile_id=[integer]`
 `appointment_id=[integer]`
 * DATA RESPONSE:

##### Create a Prescription
 * URI: <br>
 `/prescriptions`
 * METHOD: <br>
  `POST`
 * DATA PARAMS: <br>
 `api_key=[string]`
 `profile_id=[integer]`
 `provider_id=[integer]`
 `name=[string]`
 `date=[unix]`
 `directions=[string]`
 `refill=[boolean]`
 `dose_units=[enum]`<br>

 * DATA RESPONSE:

##### Retrieve a Prescription
 * URI: <br>
 `/prescriptions`
 * METHOD: <br>
  `POST`
 * DATA PARAMS: <br>
 `api_key=[string]`
 `profile_id=[integer]`

 * DATA RESPONSE:

##### Delete a Prescription
 * URI: <br>
 `/prescriptions`
 * METHOD: <br>
  `DELETE`
 * DATA PARAMS: <br>
 `api_key=[string]`
 `profile_id=[integer]`
 `provider_id=[integer]`
 `prescription_id=[integer]`

 * DATA RESPONSE:


## 📊 How to Run Tests

1. from the terminal and the project root, run `rspec`

## 🏗 Tech Stack List

* Ruby v 2.5
* JavaScript
* HTML/CSS

## 📥 How To Contribute

1. Fork this repo
2. Create your feature branch (`git checkout -b feature/thingamajig`)
3. Commit your changes (`git commit -am 'Added a cool doodad!'`)
4. Push to the branch (`git push origin feature/thingamajig`)
5. Create a new Pull Request

## 🚀 Core Contributors

**Norm Schultz & Miriam Bensalah**
Twitter:[@normanrs](https://twitter.com/normanrs)
Github:[https://github.com/normanrs](https://github.com/normanrs/)
Web:[http://www.normanrschultz.com](http://www.normanrschultz.com)
