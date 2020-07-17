#!/usr/bin/python3

import sys
from os import path
import cgi
import hashlib
import hmac
from tempfile import NamedTemporaryFile
import re
import subprocess
from email.mime.application import MIMEApplication
from email.generator import BytesGenerator

FILLINS = ['id','name','date','mail']
INPUT = path.expanduser("~/policies/agreement.md")
if not path.exists(INPUT):
    INPUT = path.expanduser("~www/src/policies/agreement.md")
PANDOC = ['pandoc','-f','markdown_github-hard_line_breaks+markdown_in_html_blocks+raw_tex','--email-obfuscation=none','-V','author=Databrary','-V','geometry=margin=0.75in']

def fail(msg="", status=400):
    print("Status: " + str(status))
    print("Content-type: text/plain\n")
    print(msg)
    sys.exit(1)

with open(path.expanduser("~/.fillin.key"), "rb") as f:
    check = hmac.new(f.read(), digestmod=hashlib.sha256)

form = cgi.FieldStorage()
def field(k):
    v = form.getvalue(k)
    if not v: fail("missing " + k)
    check.update(v.encode())
    return v
fields = {f : field(f) for f in FILLINS}
auth = check.hexdigest()
if not hmac.compare_digest(form.getvalue('auth'), auth):
    fail(status=403)

md = NamedTemporaryFile("w", suffix=".md", encoding='UTF-8')
with open(INPUT, "r", encoding='UTF-8') as i:
    for l in i:
        for (f, v) in fields.items():
            l = re.sub("<!--FILLIN_" + f.upper() + "-->_*", v, l)
        md.write(l)

pd = NamedTemporaryFile("rb", suffix=".pdf")

md.flush()
subprocess.check_call(PANDOC + ['-V','date='+fields['date'],md.name,'-o',pd.name])
md.close()

msg = MIMEApplication(pd.read(), 'pdf')
pd.close()

msg["To"] = fields['mail']
msg["Subject"] = "Databrary agreement for " + fields['name'] + " [" + fields['id'] + "]"
msg.add_header('content-disposition', 'attachment', filename=fields['name']+'.pdf')

mail = subprocess.Popen(['sendmail','-i',fields['mail']], stdin=subprocess.PIPE)
BytesGenerator(mail.stdin, False).flatten(msg)
mail.stdin.close()
if mail.wait():
    fail("could not send message", 500)

print("Content-type: text/plain\n")
