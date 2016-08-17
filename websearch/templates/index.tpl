<!DOCTYPE html>
<html>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Steve Göring">

    <head>
        <title>{{title}}</title>
        % include('templates/includes.tpl')

        <script>
            (function($) {
              $.QueryString = (function(a) {
                  if (a == "") return {};
                  var b = {};
                  for (var i = 0; i < a.length; ++i) {
                      var p=a[i].split('=');
                      if (p.length != 2)
                          continue;
                      b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
                  }
                  return b;
              })(window.location.search.substr(1).split('&'))
            })(jQuery);
            $(document).ready(function() {
                var query = $.QueryString["query"];
                if (query != undefined) {
                    $("input[name=query]")[0].value  = query;
                    $(".go").click();
                }
            });
        </script>
  </head>
<body>
    % include('templates/navigation.tpl')

    <div class="maincontent">

      <section class="container theme-showcase" role="main" style="height:80%">
        <form class="form-inline search" method="get" action="#" >
            <input name="query" type="query" class="form-control"
                placeholder="Search for Papers" style="width:40%" required>

            <div class="btn-group">
                <button type="submit" class="btn btn-success go">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
            </div>
        </form>


      <div class="results">
        <hr />

        Search results for <em class="query">query</em> <text class="result-count">found ...</text>

        <article class="bg-info">
            <div class="panel panel-default">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>More</th>
                                <th></th>
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

          </ul>
        </div>
        <div>
          <text class="time"></text>ms <br><text class="server"></text>
        </div>
      </div>

      </section>
    </div>

    % include("templates/footer.tpl")

  </body>

</html>

