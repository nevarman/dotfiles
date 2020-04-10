#!/usr/bin/env python3
import os
import subprocess
countries = '''Albania
Argentina
Australia
Austria
Belgium
Bosnia_And_Herzegovina
Brazil
Bulgaria
Canada
Chile
Costa_Rica
Croatia
Cyprus
Czech_Republic
Denmark
Estonia
Finland
France
Georgia
Germany
Greece
Hong_Kong
Hungary
Iceland
India
Indonesia
Ireland
Israel
Italy
Japan
Latvia
Luxembourg
Malaysia
Mexico
Moldova
Netherlands
New_Zealand
North_Macedonia
Norway
Poland
Portugal
Romania
Serbia
Singapore
Slovakia
Slovenia
South_Africa
South_Korea
Spain
Sweden
Switzerland
Taiwan
Thailand
Turkey
Ukraine
United_Kingdom
United_States
Vietnam'''

output = subprocess.check_output(['nordvpn', 'status'])
if b'Connected' in output:
    print("connected")
    args = "Disconnect"
else:
    args = "Connect \n Connect to" 
p1 = subprocess.Popen(["echo", "%s" % (args)], stdout=subprocess.PIPE)
p2 = subprocess.Popen(["rofi", "-dmenu"], stdin=p1.stdout, stdout=subprocess.PIPE)
p1.stdout.close()  # Allow p1 to receive a SIGPIPE if p2 exits.
output, err = p2.communicate()
if err != None:
    pass

if b"Connect" in output and b"to" not in output:
    subprocess.call(['nordvpn', 'connect'])
elif b"Disconnect" in output:
    subprocess.call(['nordvpn', 'd'])
elif b"to" in output:
    p1 = subprocess.Popen(["echo", "%s" % (countries)], stdout=subprocess.PIPE)
    p2 = subprocess.Popen(["rofi", "-dmenu"],
                      stdin=p1.stdout, stdout=subprocess.PIPE)
    p1.stdout.close()  # Allow p1 to receive a SIGPIPE if p2 exits.
    country, err = p2.communicate()
    if err != None:
        pass
    c = (str(country, 'utf-8'))
    c = c.replace('\n','')
    print(c)
    subprocess.call(['nordvpn', 'connect', c])
