#!/usr/local/bin/python
import csv
import pexpect

print("Downloading Processing's .tgz to copy")
downloader = pexpect.spawn('wget -nc -O processing.tgz http://download.processing.org/processing-3.4-linux64.tgz')
downloader.expect(pexpect.EOF)

print("Creating .bashprofile_temp to copy")
with open('temp_bash_profile', 'w') as bashprofile:
    bashprofile.write('firefox http://lukestorry.com/code-a-clock & ')
    bashprofile.write('tar -xzf ~/processing.tgz;\n')
    bashprofile.write('~/processing-3.4/processing &')

with open('passwords.csv', 'r') as csvfile:
    reader = csv.reader(csvfile)
    for username, password in reader:
	print
        print "SCPing files to", username, password

        scp_bash = pexpect.spawn("scp temp_bash_profile %s@it025960.users.bris.ac.uk:./.bash_profile" % username)
        needs_confimation = scp_bash.expect(["password", "yes"])
        if needs_confimation:
            scp_bash.sendline("yes")
            scp_bash.expect("password")
        scp_bash.sendline(password)
	print scp_bash.read(),

        scp_processing = pexpect.spawn("scp processing.tgz %s@it025960.users.bris.ac.uk:." % username)
        scp_processing.expect("password", timeout=5)
        scp_processing.sendline(password)
	print scp_processing.read()
	print

print "All done!"