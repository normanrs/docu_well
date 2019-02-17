# 📱 Project/App Title
> Subtitle here

Introdution/Description of what the program does.

## ⚙️ Initial Setup

OS X & Linux:

```sh
bundle
rails s (to spin up the server)
```

## 🕹 How to Use

POST https://my-health-tracker.herokuapp.com/api/v1/users    
params: { email: 'test_user1@email.com', password: '12345' }

GET  https://my-health-tracker.herokuapp.com/api/v1/users    
params: { email: 'test_user1@email.com', password: '12345' }

POST  https://my-health-tracker.herokuapp.com/api/v1/providers
params: {
  given_name: 'Tom',
  surname: 'Hanks',
  street_address: '123 Hollywood Dr',
  city: 'Hollywood',
  state: 'CA',
  zip: '11111',
  phone: '915-111-2222',
  api_key: 'RM-ezg2q0x5JqILnP422gQ'
 }

GET  https://my-health-tracker.herokuapp.com/api/v1/providers
 NO PARAMS

POST  https://my-health-tracker.herokuapp.com/api/v1/profile
params: {
  api_key: 'RM-ezg2q0x5JqILnP422gQ',
  user_id: 1,
  provider_id: 1,
  given_name: Angelica,
  surname: Huston,
  dob: '1950-01-01',
  height: 69,
  weight: 150,
  bp_systolic: 120,
  bp_diastolic: 80,
  heart_rate: 120,
  blood_type: 'o_positive'
 }

GET  https://my-health-tracker.herokuapp.com/api/v1/profile
params: { api_key: 'NfHnzbREj_tWkKmbdxh5Og' }


FEATURE
stuff it needs
stuff it does

## 🚧 Known Issues

Describe the app's known limitations/problems

FEATURE
stuff it needs
stuff it does

FEATURE
stuff it needs
stuff it does

FEATURE
stuff it needs
stuff it does

## 📊 How to Run Tests

OS X & Linux:

```sh
rspec (to run tests)
```

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

**Norm Schultz**
Twitter:[@normanrs](https://twitter.com/normanrs)
Github:[https://github.com/normanrs](https://github.com/normanrs/)
Web:[http://www.normanrschultz.com](http://www.normanrschultz.com)
