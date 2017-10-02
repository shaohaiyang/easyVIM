#!/usr/bin/env python
#coding:utf8
"""
Title: pytk_demo
Desc: pytk_demo
Date: 2017-05-28 16:44
Author: Shaohy<shaohaiyang@gmail.com>
Tags: 
"""

from Tkinter import *
import sys,random
from tkFont import *
from tkMessageBox import *
from tkFileDialog import *

# 支持多字节字符串
def u(string):
  codec = sys.getfilesystemencoding()
  return string.decode(codec)

window = Tk()
window.title(u('PyTk演示'))
window.attributes('-alpha',0.98)

# 全局变量定义
g_font = Font(family='Helvetica',size=30,weight='bold')
g_color = '#D5E0EE'
filename = None

frame=Frame(window,width=600,height=400,bg=g_color)
frame.pack()

# 定义一个菜单栏
def callHelp():
    g_randnum = random.randrange(1,8)
    print(g_randnum)
    if g_randnum == 1:
        askokcancel(u('帮助文档演示'),u('人生苦短，\n我用python'))
    if g_randnum == 2:
        askquestion(u('帮助文档演示'),u('人生苦短，\n我用python'))
    if g_randnum == 3:
        askretrycancel(u('帮助文档演示'),u('人生苦短，\n我用python'))
    if g_randnum == 4:
        askyesno(u('帮助文档演示'),u('人生苦短，\n我用python'))
    if g_randnum == 5:
        showinfo(u('帮助文档演示'),u('人生苦短，\n我用python'))
    if g_randnum == 6:
        showerror(u('帮助文档演示'),u('人生苦短，\n我用python'))
    if g_randnum == 7:
        showwarning(u('帮助文档演示'),u('人生苦短，\n我用python'))

def callOpen():
    filename = askopenfilename(initialdir = "./",title = "Select file",filetypes = (("jpeg files","*.jpg"),("all files","*.*")))
    print(filename)

def callChoose():
    print("{},{},{}\n".format(check1Var.get(),check2Var.get(),radioVar.get()))

menubar = Menu(window)
filemenu = Menu(menubar,tearoff = True) # 定义一个子菜单
filemenu.add_command(label='Open',command=callOpen)
filemenu.add_command(label='Save',command=callOpen)
filemenu.add_separator() # 定义一个分隔栏
filemenu.add_command(label='Help',command=callHelp)
filemenu.add_command(label='Exit',command=window.quit) # 添加到上层容器里
menubar.add_cascade(label='File',menu=filemenu) # 显示菜单

check1Var = IntVar()
check2Var = IntVar()
radioVar = IntVar()
demobar = Menu(menubar,tearoff = True)
demobar.add_checkbutton(label='check1',command=callChoose,selectcolor='blue',variable=check1Var)
demobar.add_checkbutton(label='check2',command=callChoose,selectcolor='red',variable=check2Var)
demobar.add_separator() # 定义一个分隔栏
demobar.add_radiobutton(label='red',command=callChoose,selectcolor='red',variable=radioVar,value=1)
demobar.add_radiobutton(label='blue',command=callChoose,selectcolor='blue',variable=radioVar,value=2)
menubar.add_cascade(label='Choose',menu=demobar)

# 定义一个右键弹出菜单
def popup(event):
    popup_menu.post(event.x_root, event.y_root)

popup_menu = Menu(window,tearoff = False)
popup_menu.add_command(label=u('复制'),command=None)
popup_menu.add_command(label=u('粘贴'),command=None)
frame.bind('<Button-2>', popup)

# 定义一个下拉菜单
g_options = ['one','two','three','zero']
choose = StringVar()
choose.set(g_options[0])

def callOption():
    top = Toplevel()
    top.title(u('你的选择'))
    top.attributes('-alpha',0.8)
    Label(top,text=choose.get(),font=g_font,padx=10,pady=10,justify=CENTER).grid(row=3,column=2)

OptionMenu(frame,choose,*g_options).pack()
Button(frame,text='Choose',command=callOption).pack()

# 定义一个固定下拉框
w = Spinbox(frame,from_=0,to=10).pack()
w = Spinbox(frame,values=('level1','level2','level3')).pack()


window.config(menu=menubar)
window.mainloop()
