while true; \
do \
    ping -c1 8.8.8.8 &>/dev/null \
        && echo "rgb 00ff00ff" > /tmp/ckbpipe000 \
        || echo "rgb ff0000ff" > /tmp/ckbpipe000; \
    sleep 10; \
done;
