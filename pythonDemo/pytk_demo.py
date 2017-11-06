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
frame.grid(sticky=E)

def Init():
    frame=Frame(window,width=600,height=400,bg=g_color)
    frame.grid(sticky=E)

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

def callSave():
    asksaveasfilename(initialdir = "./",title = "Select file",filetypes = (("jpeg files","*.jpg"),("all files","*.*")))

menubar = Menu(window)
filemenu = Menu(menubar,tearoff = True) # 定义一个子菜单
filemenu.add_command(label='Open',command=callOpen)
filemenu.add_command(label='Save',command=callSave)
filemenu.add_separator() # 定义一个分隔栏
filemenu.add_command(label='Help',command=callHelp)
filemenu.add_command(label='Exit',command=window.quit) # 添加到上层容器里
menubar.add_cascade(label='File',menu=filemenu) # 显示菜单

# 定义一个菜单栏
def callDemos():
    LabelDemo(LabelVar.get())
    if ButtonVar.get():
        print('check & radio demo')
    if EntryVar.get():
        print('Entry demo')
    if ListVar.get():
        print('Listbox demo')
    if TextVar.get():
        print('Textarea demo')

LabelStr = StringVar()
def callChageLabel():
    LabelStr.set(u('Label改变：World'))

def LabelDemo(use=0):
    if use:
        LabelStr.set(u('Label演示：Hello'))
        labelframe = LabelFrame(frame,text=u('Label Demo')).grid(row=0)
        Label(labelframe, textvariable=LabelStr).grid(row=1)
        Button(labelframe,text=u('改变'),command=callChageLabel).grid(row=2)
    else:
        Init()

LabelVar = IntVar()
ButtonVar = IntVar()
EntryVar = IntVar()
ListVar = IntVar()
TextVar = IntVar()
RadioVar = IntVar()
demobar = Menu(menubar,tearoff = True)
demobar.add_checkbutton(label='Label & Button',command=callDemos,selectcolor='blue',variable=LabelVar)
demobar.add_checkbutton(label='CheckButton & RadioButton',command=callDemos,selectcolor='red',variable=ButtonVar)
demobar.add_checkbutton(label='Entry',command=callDemos,selectcolor='red',variable=EntryVar)
demobar.add_checkbutton(label='Listbox',command=callDemos,selectcolor='red',variable=ListVar)
demobar.add_checkbutton(label='Text',command=callDemos,selectcolor='red',variable=TextVar)
demobar.add_separator() # 定义一个分隔栏
demobar.add_radiobutton(label='red',command=callDemos,selectcolor='red',variable=RadioVar,value=1)
demobar.add_radiobutton(label='blue',command=callDemos,selectcolor='blue',variable=RadioVar,value=2)
menubar.add_cascade(label='Demos',menu=demobar)

# 定义一个右键弹出菜单
def popup(event):
    popup_menu.post(event.x_root, event.y_root)

popup_menu = Menu(window,tearoff = False)
popup_menu.add_command(label=u('复制'),command=None)
popup_menu.add_command(label=u('粘贴'),command=None)
frame.bind('<Button-2>', popup)

"""
# 定义一个下拉菜单
g_options = ['one','two','three','zero']
choose = StringVar()
choose.set(g_options[0])

def callOption():
    top = Toplevel()
    top.title(u('你的选择'))
    top.attributes('-alpha',0.8)
    Label(top,text=choose.get(),font=g_font,padx=10,pady=10,justify=CENTER).grid(row=3,column=2)

OptionMenu(frame,choose,*g_options).grid(row=1,column=1)
Button(frame,text='Choose',command=callOption).grid(row=1,column=2)

# 定义一个固定下拉框
w = Spinbox(frame,from_=0,to=10).grid(row=2,column=1)
w = Spinbox(frame,values=('level1','level2','level3')).grid(row=2,column=2)
"""


window.config(menu=menubar)
window.mainloop()
