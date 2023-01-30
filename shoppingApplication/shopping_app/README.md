Shopping Application

## Hive database is used to store the cart data
## firebase is used for authentication
## stripe payemnt is used for the payment

-   login screen
    -   Use firebase auth with email and password
-   Signup page
    -   User signup with their email and password.
    -   Store user data into firebase.
-   After login
    -   User land onto dashboard and dashboard has following features:
        -   The whole list of products is visible on the product listing
            screen with LAZY LOADING, which is a SEARCHABLE LIST VIEW.
        -   Use
            https://api.flutter.dev/flutter/material/FilterChip-class.html
            for making a list filterable on different categories.
        -   The LIST VIEW should be dynamic, according to searched
            string.
        -   The user should navigate the product details screen by
            tapping on the product.
        -   The user should be able to add products to the cart screen.
        -   The cart should be persisted even if the user closes the app
            from memory.
        -   By pressing the cart button on top in the App bar, the user
            should navigate to the cart screen.
        -   The screen should have all the items added to the cart and
            the option to remove items from the cart.
            
           
