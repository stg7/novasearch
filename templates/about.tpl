<!DOCTYPE html>
<html>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Steve Göring">
    <head>
        <title>{{title}}</title>

        % include('templates/includes.tpl')


        <script type="text/javascript">
        $().ready(function() {
          build_toc();
        });

        </script>
    </head>
<body>

    % include('templates/navigation.tpl')

    <div class="maincontent">
      <section class="container theme-showcase" role="main" style="height:80%">

      <div class="about">
        <article>
            <h2 id="about">About</h2>
            <p>
            {{title}} is a small proof-of-concept project. I collected a lot of computer science papers and
            wanted to try the search back end <a href="http://lucene.apache.org/solr/" >Apache Solr</a>.
            Solr is based on lucene, what I already used before. So indexing using Solr is quite easy, just
            store all pdfs,... in one directory and add it to a solr collection
            (so it will need a bit of time, and it requires to increase the used memory up to 5GB).
            </p>
            <h3>Frontend for Solr</h3>
            <p>
            Indexing was quite straight forward, so I was looking for a nice modern front end, but I could not found a suitable one.
            There exists a lot of front ends, but some are ugly, some are ruby and some won't work anymore.
            That's why I created an own web interface using python3, bottle and a bit of javascript magic.
            </p>
            <h3>Motivation</h3>
            You collect several papers a whole life in scientific research, it is annoying if you cannot find
            the suitable paper or text:
            <div class="alert alert-info" role="alert">
                <em>"Information is nothing without retrieval."</em>
            </div>
            Using this approach you always need to have good techniques for getting your needed informations for your local library/collection of papers.
            <h3 id="develop">Development</h3>
            <p>
            You can look at the github page for more information about local development and setup.
            </p>
        </article>
      </div>

      </section>
    </div>

    % include("templates/footer.tpl")

  </body>

</html>

