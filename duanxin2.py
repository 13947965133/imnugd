import urllib, urllib2, sys


host = 'http://sms.market.alicloudapi.com'
path = '/singleSendSms'
method = 'GET'
appcode = 'e8de07b0351d43b4b9bdc735b0d1fc45'
querys = 'ParamString=%7B%22no%22%3A%22123456%22%7D&RecNum=1571335466'
bodys = {}
url = host + path + '?' + querys

request = urllib2.Request(url)
request.add_header('Authorization', 'APPCODE ' + appcode)
response = urllib2.urlopen(request)
content = response.read()
if (content):
    print(content)