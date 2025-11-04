POST http://localhost/soap/AuthRequest
Content-Type: text/xml
```xml
<?xml version='1.0' encoding='UTF-8'?>
<S:Envelope xmlns:S="http://www.w3.org/2003/05/soap-envelope">
  <S:Header>
    <ns4:context xmlns="urn:admin" xmlns:ns2="urn:mail" xmlns:ns3="urn:account" xmlns:ns4="urn:sample">
      <ns4:authTokenControl voidOnExpired="true"/>
    </ns4:context>
  </S:Header>
  <S:Body>
    <ns3:AuthRequest xmlns="urn:admin" xmlns:ns2="urn:mail" xmlns:ns3="urn:account" xmlns:ns4="urn:sample">
      <ns3:account by="name">marco@sample.io</ns3:account>
      <ns3:password>sample</ns3:password>
    </ns3:AuthRequest>
  </S:Body>
</S:Envelope>
```
HTTP 200
[Captures]
tk: cookie "AUTH_TOKEN"

# ============= cURL comparison ===========
#
#
# curl --header 'Content-Type: text/xml' \
#   --data $'<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n\
#<S:Envelope xmlns:S="http://www.w3.org/2003/05/soap-envelope">\n\
#  <S:Header>\n\
#    <ns4:context xmlns="urn:admin" \
# xmlns:ns2="urn:mail" \
# xmlns:ns3="urn:account" \
# xmlns:ns4="urn:sample">\n\
#      <ns4:authTokenControl voidOnExpired="true"/>\n\
#    </ns4:context>\n\
#  </S:Header>\n\
#  <S:Body>\n\
#    <ns3:AuthRequest xmlns="urn:admin" \
# xmlns:ns2="urn:mail" \
# xmlns:ns3="urn:account" \
# xmlns:ns4="urn:sample">\n\
#      <ns3:account by="name">marco@sample.io</ns3:account>\n\
#      <ns3:password>sample</ns3:password>\n\
#    </ns3:AuthRequest>\n\
#  </S:Body>\n\
# </S:Envelope>\n' \
#  'http://localhost/soap/AuthRequest'
