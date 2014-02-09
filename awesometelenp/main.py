#!/usr/bin/env python
#
# Copyright 2011 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
from google.appengine.ext import webapp
from google.appengine.ext.webapp import util

mapurl = "";

class SendHandler(webapp.RequestHandler):
    def get(self):
        mapurl = self.request.get("map")
        # Set the cross origin resource sharing header to allow AJAX
        self.response.headers.add_header("Access-Control-Allow-Origin", "*")
        # Print some JSON
        #self.response.out.write('{"url":"'+ mapurl +'"}\n')

    def post(self):
        mapurl = self.request.get("map")
        # Set the cross origin resource sharing header to allow AJAX
        self.response.headers.add_header("Access-Control-Allow-Origin", "*")
        # Print some JSON
        #self.response.out.write('{"url":"'+ mapurl +'"}\n')

class ReturnHandler(webapp.RequestHandler):
    def get(self):
        #mapurl = self.request.get("map")
        # Set the cross origin resource sharing header to allow AJAX
        self.response.headers.add_header("Access-Control-Allow-Origin", "*")
        # Print some JSON
        self.response.out.write('{"url":"'+ mapurl +'"}\n')

    def post(self):
        #mapurl = self.request.get("map")
        # Set the cross origin resource sharing header to allow AJAX
        self.response.headers.add_header("Access-Control-Allow-Origin", "*")
        # Print some JSON
        self.response.out.write('{"url":"'+ mapurl +'"}\n')

def main():
    application = webapp.WSGIApplication([('/send', SendHandler),('/return', ReturnHandler)],
                                         debug=True)
    util.run_wsgi_app(application)

if __name__ == '__main__':
    main()
