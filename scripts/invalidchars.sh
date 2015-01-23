for i in *
  mv $i $(echo $i | ack '(\d{1,2})' -o).jpg
