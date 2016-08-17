<!DOCTYPE html>
<html>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Steve Göring">
    <head>
        <title>{{title}}</title>

        % include('templates/includes.tpl')

    </head>
<body>

    % include('templates/navigation.tpl')

    <div class="maincontent">
      <section class="container theme-showcase" role="main" style="height:80%">

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

    % include("templates/footer.tpl")

  </body>

</html>

