#!/usr/bin/env python
# coding: utf8
from flask import Flask,request,session,g,redirect,abort,url_for,render_template,flash

# configuration
DATABASE = '/tmp/flaskr.db'
DEBUG = True
SECRET_KEY = 'development key'
USERNAME = 'admin'
PASSWORD = 'default'

app = Flask(__name__)

@app.route('/')
def index():
  return render_template('index.html')

if __name__ == '__main__':
  app.run()
