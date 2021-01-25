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

- Bug - Passenger list record changes in the background but doesn't update immediately
- Add app clip entry 
- implement helper for simulating network calls
