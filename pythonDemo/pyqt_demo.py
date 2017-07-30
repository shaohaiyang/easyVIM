#!/usr/bin/env python
#coding: utf8

#Title: pyqt_demo
#Date: 2017-05-28 16:54
#Author: Shaohy<shaohaiyang@gmail.com>
#Tags: 
#Slug: pyqt_demo

import sys
from PyQt4.QtGui import *

def window():
  app = QApplication(sys.argv)
  win = QWidget()
  win.resize(250, 150)
  win.setWindowTitle(u'这是一个中文测试框架')
  grid = QGridLayout()
  for i in xrange(1,5,1):
    for j in xrange(1,5,1):
      grid.addWidget(QPushButton('BTN'+str(i) + str(j)),i,j)

  win.show()
  win.setLayout(grid)
  sys.exit(app.exec_())


if __name__ == '__main__':
  window()
