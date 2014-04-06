import webapp2
import json

from google.appengine.ext import ndb

# Record
# A record of a single signup (database entry).
class Record(ndb.Model):
    email = ndb.StringProperty(indexed=False)
    organisation = ndb.StringProperty(indexed=False)
    members = ndb.StringProperty(repeated=True)
    timestamp = ndb.DateTimeProperty(auto_now_add=True)

# RegistrationHandler
# The handler that listens on /register
# for signup submissions
class RegistrationHandler(webapp2.RequestHandler):
    def get(self):
        
        # Create and insert a record
        # for this registration.
        record = Record(parent=ndb.Key('Records', 'default'))
        
        record.email = self.request.get('email')
        record.organisation = self.request.get('organisation')
        record.members = json.loads(self.request.get('members'))

        record.put()
        
        # Inform the client of success.
        self.response.headers['Content-Type'] = 'application/json'
        self.response.write(json.dumps({
            'success': True
        }))

application = webapp2.WSGIApplication([
    ('/register', RegistrationHandler)
], debug=True)
