#!/usr/bin/env python3

import getpass
import sys
from passlib.hash import sha512_crypt

def p_hash(x):
    hash = sha512_crypt.hash(x)
    print(hash)

if __name__ == "__main__":
    if len(sys.argv) > 1: 
      passwd = sys.argv[1]
      p_hash(passwd)
    else:
      passwd = getpass.getpass('Enter Password to Hash: ')
      p_hash(passwd)
