<h3>Instruction</h3>
<ul>
    <li>bundle install</li>
    <li>rake db:migrate</li>
    <li>rake db:seed</li>
</ul>
<h3>Progress</h3>
<ul>
    <li>
        <p>Go to console and create user with image</p>
        <p>User.create(email: "alex@mail.com", name: "Alexander Purkhalo", password: "ppppppppp", picture: File.open("image.jpg", "rb"))</p>
        <p>User.last.picture.url</p>
    </li>
    <li>
        <p>Update user's image</p>
        <p>User.last.picture =  File.open("new_image.jpg", "rb")</p>
        <p>User.last.picture.url</p>
    </li>
</ul>