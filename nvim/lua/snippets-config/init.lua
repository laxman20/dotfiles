require 'snippets'.snippets = {
  python = {
    main = [[
import requests
import urllib3
import sys
import datetime

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

def main():
    $0

if __name__ == '__main__':
    main()
]]
  }
}
