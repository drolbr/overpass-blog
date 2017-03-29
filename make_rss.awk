BEGIN {
  baselink = "https://dev.overpass-api.de/blog/";

  print "<?xml version=\"1.0\"?>";
  print "<rss version=\"2.0\">";
  print "<channel>";
  print "  <title>Overpass API Blog</title>";
  print "  <link>"baselink"</link>";
  print "  <description>Overpass API Blog</description>\n";
}
{
  published = $1;
  match($0,"^[^.]*\\.html ");
  filename = substr($0,12,RLENGTH-12);
  title = substr($0,RLENGTH+1);

  if (filename != "index.html")
    print "  <item>\n    <title>"title"</title>\n    <link>"baselink filename"</link>\n    <guid>"baselink filename"</guid>\n    <description>"title"</description>\n    <pubDate>"published"</pubDate>\n  </item>";
}
END {
  print "\n</channel>";
  print "</rss>";
}
