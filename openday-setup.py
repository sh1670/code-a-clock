#!/usr/local/bin/python

"""
This file should be run on snowy with a passwords.csv file in the same folder.
If you are updating the version of processing, be sure to update the number in all four places.
"""

import csv
import pexpect

print("Downloading Processing's .tgz to copy")
downloader = pexpect.spawn('wget -nc http://download.processing.org/processing-3.5.3-linux64.tgz')
downloader.expect(pexpect.EOF)
print downloader.read()

print("Creating .bashprofile_temp to copy")
with open('temp_bash_profile', 'w') as bashprofile:
    bashprofile.write('firefox https://sh1670.github.io/code-a-clock & ')
    bashprofile.write('tar -xzf ~/processing-3.5.3-linux64.tgz;\n')
    bashprofile.write('~/processing-3.5.3/processing &')

with open('passwords.csv', 'r') as csvfile:
    reader = csv.reader(csvfile)
    for username, password in reader:
	print
        print "SCPing files to", username, password

        scp_bash = pexpect.spawn("scp temp_bash_profile %s@snowy.cs.bris.ac.uk:./.bash_profile" % username)
        needs_confimation = scp_bash.expect(["password", "yes"])
        if needs_confimation:
            scp_bash.sendline("yes")
            scp_bash.expect("password")
        scp_bash.sendline(password)
	print scp_bash.read(),

        scp_processing = pexpect.spawn("scp processing-3.5.3-linux64.tgz %s@snowy.cs.bris.ac.uk:." % username)
        scp_processing.expect("password", timeout=5)
        scp_processing.sendline(password)
	print scp_processing.read()
	print

print "All done!"
