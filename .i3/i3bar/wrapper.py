#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# This script is a simple wrapper which prefixes each i3status line with custom
# information. It is a python reimplementation of:
# http://code.stapelberg.de/git/i3status/tree/contrib/wrapper.pl
#
# To use it, ensure your ~/.i3status.conf contains this line:
#     output_format = "i3bar"
# in the 'general' section.
# Then, in your ~/.i3/config, use:
#     status_command i3status | ~/i3status/contrib/wrapper.py
# In the 'bar' section.
#
# In its current version it will display the cpu frequency governor, but you
# are free to change it to display whatever you like, see the comment in the
# source code below.
#
# © 2012 Valentin Haenel <valentin.haenel@gmx.de>
#
# This program is free software. It comes without any warranty, to the extent
# permitted by applicable law. You can redistribute it and/or modify it under
# the terms of the Do What The Fuck You Want To Public License (WTFPL), Version
# 2, as published by Sam Hocevar. See http://sam.zoy.org/wtfpl/COPYING for more
# details.

import sys
import subprocess
import json
import re

def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()

def read_line():
    """ Interrupted respecting reader for stdin. """
    # try reading a line, removing any extra whitespace
    try:
        line = sys.stdin.readline().strip()
        # i3status sends EOF, or an empty line
        if not line:
            sys.exit(3)
        return line
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()

def cmus():
    #get music info from cmus
    musicInfo = 'M: '
    fileName = ''
    artist = ''
    title = ''
    
    try:
        rawInfo = str(subprocess.check_output(['cmus-remote', '-Q']))
    except:
        rawInfo = ''
    if rawInfo:
        for line in rawInfo.split('\n'):
            fileGroup = re.search(r'^file (.*?)$', line)
            if fileGroup:
                location = fileGroup.group(1)
                fileName = re.search(r'^/(?:.*?/)*(.*)\..*$', location).group(1)
            elif line.startswith('tag title'):
                title = line[10:]
            elif line.startswith('tag artist'):
                artist = line[11:]

        #organise into final string
        if title or fileName:
            if artist:
                musicInfo += artist+' - '
            musicInfo += title if title else fileName
        else:
            musicInfo += 'inactive'
    else:
        musicInfo = ''
    return musicInfo

def mpd():
    #get music info from cmus
    musicString = 'M: '
    info = {'file':'', 'artist':'', 'title':''}
    
    #get data from via mpc
    try:
        for attribute in info.keys():
            info[attribute] = subprocess.check_output(['mpc', '-f', '%{}%'.format(attribute), 'current']).decode().strip()
    except subprocess.CalledProcessError:
        return ''

    #organise into final string
    if info['file']:
        fileRe = re.search(r'^(?:.*?/)*(.*)\..*$', info['file']) #grab filename from relative filepath
        if fileRe:
            info['file'] = fileRe.group(1)
        if info['artist']:
            musicString += info['artist'] + ' - '
        musicString += info['title'] if info['title'] else info['file']
    else:
        musicString += 'Inactive'
    return musicString

if __name__ == '__main__':
    # Skip the first line which contains the version header.
    print_line(read_line())

    # The second line contains the start of the infinite array.
    print_line(read_line())

    while True:
        line, prefix = read_line(), ''
        # ignore comma at start of lines
        if line.startswith(','):
            line, prefix = line[1:], ','

        j = json.loads(line)
        # insert information into the start of the json, but could be anywhere
        
        musicString = mpd()

        #add to json structure
        if musicString:
            j.insert(0, {'full_text' : musicString, 'name' : 'music'})

        # and echo back new encoded json
        print_line(prefix+json.dumps(j))

