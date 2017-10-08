
import socket
import time

from random import randint
from math import sin

def main():

    UDP_IP = "10.93.0.146" #l' idirizzo ip dove mandare i dati
    UDP_PORT = 8125

    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    i=0
    while True:
        data = "sin:"+str(100*sin(2*i))+"|c"
        sock.sendto(data, (UDP_IP, UDP_PORT))
        i += 0.1
        print (data )
        time.sleep(5)

if __name__ == "__main__":
    main()
