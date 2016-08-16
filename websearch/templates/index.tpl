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

            <a href="./" class="logo">{{title}}</a>

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


      <div class="results">
        <hr />

        Search results for <em class="query">query</em>

        <article class="bg-info">
            <div class="panel panel-default">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Pdf</th>
                            </tr>
                        </thead>
                        <tbody id="results">
                        <!-- results -->
                        </tbody>
                    </table>
                </div>
            </div>

        </article>
        <div class="pages">
          <ul class="pagination" id="pages">
              <!--
            <li>
              <a href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
              -->
            <!--
            <li>
              <a href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
            -->
          </ul>
        </div>
        <div>
          <text class="time"></text>ms <br><text class="server"></text>
        </div>
      </div>

      </section>
    </div>

    <footer>
      &copy; stg7 2016 - <a href="https://github.com/stg7" >Steve Göring</a>
    </footer>

  </body>

</html>

