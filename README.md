<h3>Instruction</h3>
<ul>
    <li>bundle install</li>
    <li>rake db:migrate</li>
    <li>rake db:seed</li>
</ul>
<h3>Progress</h3>
<ul>
    <li>In DB find access_token value of certain user</li>
    <li>In Postman add to Headers: authorization key with it's user's access_token as value</li>
    <li>Then create DELETE request to http://localhost:3000/users/:id page</li>
    <li>Check rendering of: { message: 'User was destroyed' } </li>
    <li>See that user was deleted from db</li>
    <li>Try to miss token and send request to dele of any other existing user</li>
    <li>Ckechout error as render: { error: 'Failed to confirm person' }</li>
</ul>