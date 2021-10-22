{
  if (filename == "")
    filename = $0;
  
  if (title == "" && substr($1,1,4) == "<h1>")
    title = substr($0,5,length($0)-9);
  
  if (published == "" && substr($1,1,12) == "<p>Published")
  {
    match($0,"20[0-9]{2}-[0-9]{2}-[0-9]{2}");
    published = substr($0,RSTART,RLENGTH);
  }
}
END {
  if (filename != "index.html")
    print published" "filename" "title;
}
