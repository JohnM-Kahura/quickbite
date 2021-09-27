import requests, time
r = requests.post('http://mpesa-requestbin.herokuapp.com/1e6nekh1', data={"ts":time.time()})
print (r.status_code)
print (r.content)
# urlll='http://mpesa-requestbin.herimport requests, time r = requests.post('http://mpesa-requestbin.herokuapp.com/1e6nekh1', data={"ts":time.time()}) print r.status_code print r.contentokuapp.com/1e6nekh1'