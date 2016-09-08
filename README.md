<h3>Instruction</h3>
<ul>
    <li>bundle install</li>
    <li>rake db:migrate</li>
    <li>rake db:seed</li>
</ul>
<h3>Progress</h3>
<ul>
    <li>$ curl -X POST -H "Content-Type: application/json" -d '{"user": {"email": "lord@example.com", "password": "12341234"}}' http://localhost:3000/users</li>
    <li>output: {"email":"tarakan@mail.com","token_type":"Bearer","user_id":4,"access_token":"dsfsdfofsfmkdf"}</li>
    <li>$ curl -X POST -H "Content-Type: application/json" -d '{"user": {"email": "lord@example.com", "password": "12341234"}}' http://localhost:3000/users</li>
    <li>output: {"error": "Email in use"}</li>
</ul>