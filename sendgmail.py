#!/usr/bin/env python

import re, sys
from smtplib import SMTP_SSL
from email.mime.text import MIMEText
from getpass import getpass

def prompt(mess, passwd=False):
    if passwd:
        return getpass(mess).strip()
    return raw_input(mess).strip()

def connect(server, username, password):
    smtp = SMTP_SSL()
    smtp.connect(server)
    smtp.login(username, password)
    return smtp

def getmessage(sender, recipient, subject, body):
    msg = MIMEText(body)
    msg['Subject'] = subject
    msg['From'] = username+'@gmail.com'
    msg['To'] = recipient
    return msg

def sendmessage(smtp, msg):
    smtp.sendmail(msg['From'],[msg['To']], msg.as_string())
    smtp.quit()

def sendgmail(username, password, recipient, subject, body):
    smtp = connect('smtp.gmail.com', username, password)
    msg = getmessage(username+'@gmail.com', recipient, subject, body)
    sendmessage(smtp, msg)

if __name__=='__main__':
    if len(sys.argv)!=3 or sys.argv[1] not in ('-f','-m'):
        print('Usage: sendgmail {-f|-m} <file|message>')
        exit()
    username = prompt('Enter username: ')
    password = prompt('Enter password: ', passwd=True)
    smtp = connect('smtp.gmail.com',username,password)
    recipient = prompt('Enter recipient: ')
    subject = prompt('Enter subject: ')
    if sys.argv[1] == '-f':
        body = open(sys.argv[2], 'r').read()
    else:
        body = sys.argv[2]
    msg = getmessage(username+'@gmail.com', recipient, subject, body)
    sendmessage(smtp, msg)
    print('Message sent')


