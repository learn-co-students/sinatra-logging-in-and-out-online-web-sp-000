
[1mFrom:[0m /mnt/c/Users/bczor/dev/flatiron/labs/sinatra-logging-in-and-out-online-web-sp-000/app/views/account.erb @ line 9 self.__tilt_70368328972660:

     [1;34m4[0m:     <meta charset="UTF-8">
     [1;34m5[0m:     <title>title</title>
     [1;34m6[0m:     <link rel="stylesheet" href="stylesheets/bootstrap.css" type="text/css">  
     [1;34m7[0m:   </head>
     [1;34m8[0m:   <body id="page-top">
 =>  [1;34m9[0m:   <%binding.pry%>
    [1;34m10[0m:     <h1>Welcome <%= Helper.current_user %></h1>
    [1;34m11[0m:     
    [1;34m12[0m:      <h3>Your Balance: <%= Helper.current_user.balance %></h3>
    [1;34m13[0m:     
    [1;34m14[0m:     <a href="/logout">Log Out</a>

