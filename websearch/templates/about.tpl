<!DOCTYPE html>
<html>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="author" content="Steve Göring">
   <head>
    <title>{{title}}</title>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="static/solrsearch.css">

        <script src="static/solrsearch.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Orbitron:900' rel='stylesheet' type='text/css'>

  </head>

<body>
    <nav class="navbar">
        <div class="container">

            <a href="./" class="logo">Solr Search</a>

            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="http://github.com/stg7/phrasit" target="_blank">
                    <img src="https://assets-cdn.github.com/images/modules/logos_page/GitHub-Mark.png" style="height:1.5em" />
                    </a>
                </li>
                <li>
                    <a href="./about" >about</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="maincontent">
      <section class="container theme-showcase" role="main" style="height:80%">

    <form class="form-inline search" method="get" action="./index.html" >
        <input name="query" type="query" class="form-control"
            placeholder="Search for Papers" style="width:40%" required>

        <div class="btn-group">
            <button type="submit" class="btn btn-success go"><span class="glyphicon glyphicon-search"></span></button>
            </button>
        </div>
    </form>


      <div class="about">
        <hr />
        <p><em>"Information is nothing without retrieval."</em></p>
        <p>
        {{title}} is a small proof-of-concept project. I collected a lot computer science papers and
        wanted to try the search backend <a href="http://lucene.apache.org/solr/" >apache solr</a>
        that is based on lucene.
        </p>
        <p>
        I was looking for a nice modern frontend, but I could not found a suitable one.
        That's why I created an own web interface using python3, bottle and a bit of javascript.
        </p>
        <p>
        .....
        </p>
      </div>

      </section>
    </div>

    <footer>
      &copy; stg7 2016 - <a href="https://github.com/stg7" >Steve Göring</a>
    </footer>

  </body>

</html>

