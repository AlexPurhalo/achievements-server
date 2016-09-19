<h3>Instruction</h3>
<ul>
    <li>bundle install</li>
    <li>rake db:migrate</li>
    <li>rake db:seed</li>
</ul>
<h3>Progress</h3>
<ul>
    <li>Encode any image, using special source, here one of them: https://www.base64-image.de</li>
    <li>With Postman send json data to create user, as picture use encoded file</li>
    <li>Find user's picture url, this should exist now</li>
    <li>
        <p>In headers add "authorization" key with access_token as value</p>
        <p>Change user's picture with PUT request, as picture use another encoded image</p>
    </li>
    <li>Ensure that picture url has changed</li>
    <li>
        <p>Checkout picture</p>
        <img src="https://raw.githubusercontent.com/AlexPurhalo/achievements-server/master/tutorial/picture-upload.png"/>
    </li>
</ul>