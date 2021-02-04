#  CrossWinds

## App Clips


1. Booking
2. Check-in


### Booking App Clip Flow

1. User scans the QR code for flight or visits the link...
2. User fills in the personal details... rest are auto-filled
3. User pays for the flight and books it... This is stored for the user somewhere


AutoFilled:   flyingClass, flightNumber,  terminal , travelDate , checkInTime, departure, departureTime, destination, arrivalTime , relayVia

### Check-In App Clip Flow

1. User scans the qr code or visit site
2. Seat selection is shown... user fills in the seat and moves to payment if required.
3. A boarding pass is generated for this and saved to apple wallet... the rest details are relayed to server.


# TODO:

[-] Bug - Passenger list record changes in the background but doesn't update immediately  
[-] Add app clip entry     
- implement helper for simulating network calls  
[-] write page for after booking   
- Show sign-in with Apple on last page  



# Discourse:

## Interaction Index

Interaction Index (Interex), refers to the kind of interaction an entity can have with its source of truth. It follows a unix based mechanism to describe it:

- 1 -> execute (X):  passed source of truth maybe a function or may allow to perform an operation on the entity and derive some value from it
- 2 -> write (W) : entity writes and updates the source of truth.
- 4 ->  read (R) : entity only reads the value of source of truth.

Following the octal method of combining bits as followed by using, we can have multiple combinations of these 3 modes of operation: 1, 3, 5, 6, 7

Interex system doesn't carry any syntactical meaning to the code. Its meant to denote semantic meaning in the documentation.

For eg: X will often be used with either R or W or both.


`Source of Truth` used in documentation maynot be feasible for all cases, SwiftUI views are quite reusable. However, the `Interaction Index` is always available as the scope of view operation or any entity operation is defined by the code and not injected unlike the `Source of Truth`.
