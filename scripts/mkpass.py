#!/usr/bin/env python3
#
# Script used to generate password hashes 
# for the ansible user module
# https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#how-do-i-generate-encrypted-passwords-for-the-user-module
#
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
      passwd = getpass.getpass('Enter password to hash: ')
      p_hash(passwd)
