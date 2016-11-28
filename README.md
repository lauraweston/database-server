# Database Server Tech Test

Write a program that runs a server that is accessible on ```http://localhost:4000/```. When your server receives a request on ```http://localhost:4000/set?somekey=somevalue``` it should store the passed key and value in memory. When it receives a request on ```http://localhost:4000/get?key=somekey``` it should return the value stored at somekey.

If you finish, you can work on saving the data to a file.

### Testing
Run ```rspec``` in command line to view tests.
