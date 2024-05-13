import os
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders

var1 = os.environ.get('STRIP_FILE')
print(var1)

# user set variables
SSL_EXPIRY_DATES='/home/zignage/m-ms/bug-train/certificate-expiry-monitor/ssl_expiry_dates.txt'

# Gmail credentials
gmail_user = 'noreply@zignage.com'
gmail_app_password = '25Azerbaijan2023'

# Email details
subject = 'All Certs'
to_email = 'chris@zignage.com'
file_to_attach = var1
# Create a multipart message
msg = MIMEMultipart()
msg['From'] = gmail_user
msg['To'] = to_email
msg['Subject'] = subject

# Message body
body = 'Attached is the SSL Certificate Expiry Dates file.'
msg.attach(MIMEText(body, 'plain'))

# Attachment
with open(file_to_attach, 'rb') as attachment:
    part = MIMEBase('application', 'octet-stream')
    part.set_payload(attachment.read())
encoders.encode_base64(part)
part.add_header(
    'Content-Disposition',
    f'attachment; filename= {file_to_attach}',
)
msg.attach(part)
# Send the email
try:
    server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    server.ehlo()
    server.login(gmail_user, gmail_app_password)
    server.send_message(msg)
    server.close()
    print('Email sent!')
except Exception as e:
    print('Something went wrong...')
    print(e)
