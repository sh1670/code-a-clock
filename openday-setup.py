#!/usr/local/bin/python
import csv
import pexpect

print("Downloading Processing's .tgz to copy")
downloader = pexpect.spawn('wget -nc -O processing.tgz http://download.processing.org/processing-3.4-linux64.tgz')
downloader.expect(pexpect.EOF)

print("Creating .bashprofile_temp to copy")
with open('.bash_profile_temp', 'w') as bashprofile:
    bashprofile.write('firefox http://lukestorry.com/code-a-clock &')
    bashprofile.write('tar -xzf ~/processing.tgz;')
    bashprofile.write('~/processing/processing &')

with open('passwords.csv', 'r') as csvfile:
    reader = csv.reader(csvfile)
    for username, password in reader:

        print "starting scp for", username, password, "-",

        scp_bash = pexpect.spawn("scp .bash_profile_temp %s@snowy.cs.bris.ac.uk:./.bash_profile" % username)
        needs_confimation = scp_bash.expect(["password", "yes"])
        if needs_confimation:
            scp_bash.sendline("yes")
            scp_bash.expect("password")
        scp_bash.sendline(password)

        print "copied .bash_profile -",

        scp_processing = pexpect.spawn("scp processing.tgz %s@snowy.cs.bris.ac.uk:." % username)
        scp_processing.expect("password", timeout=5)
        scp_processing.sendline(password)

        print "copied processing.tgz"

print "All done!"
