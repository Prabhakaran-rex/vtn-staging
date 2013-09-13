# Value This Now

## Setup

### Creating an admin user

To create a new user with administrator privileges first create a new Customer (either by signing up on the homepage or via the console). Once that user has been created you should add the necessary privileges by running the following in the rails console:

```
user = Customer.find(1)
base_user = user.becomes(User)
base_user.add_role :admin 
base_user.add_role :superadmin
```

More info can be found at [Rolify's FAQ](https://github.com/EppO/rolify/wiki/FAQ#does-rolify-support-sti-)
