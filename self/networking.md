### ** OSI MODEL ** 

1. Physical Layer (Layer 1)
📌 Deals with the physical connection between devices, including cables, switches, and signals.

📌 Key Components:
    Ethernet cables
    Fiber optics
    Wireless signals (Wi-Fi, Bluetooth)
    Network Interface Cards (NIC)
    Hubs, Repeaters

📌 Example: A physical Ethernet cable connecting two computers.

2. Data Link Layer (Layer 2)
📌 Responsible for error detection, correction, and ensuring a reliable link between two directly connected nodes.

📌 Key Components:
    MAC (Media Access Control) addresses
    Switches, Bridges
    ARP (Address Resolution Protocol)

📌 Example: A switch forwarding data using MAC addresses.

3. Network Layer (Layer 3)
📌 Handles routing and addressing to ensure data reaches the correct destination.

📌 Key Components:
    IP (Internet Protocol) addresses (IPv4, IPv6)
    Routers
    ICMP (Internet Control Message Protocol)

📌 Example: A router forwarding data from one network to another.

4. Transport Layer (Layer 4)
📌 Ensures end-to-end communication, reliability, and flow control.

📌 Key Protocols:
    TCP (Transmission Control Protocol): Reliable, connection-oriented.
    UDP (User Datagram Protocol): Faster, connectionless, but less reliable.

📌 Example: TCP ensures a complete, ordered transmission of data when loading a website.

5. Session Layer (Layer 5)
📌 Manages sessions between applications (starting, maintaining, and terminating connections).

📌 Key Concepts:
    Authentication
    Authorization
    Session management (e.g., maintaining login states)

📌 Example: A video conference maintaining a session between users.

6. Presentation Layer (Layer 6)
📌 Handles data formatting, encryption, and compression.

📌 Key Functions:
    Data translation (ASCII, Unicode)
    Data encryption (SSL/TLS)
    Data compression (JPEG, MP3, GIF)

📌 Example: SSL/TLS encrypting website traffic in HTTPS.

7. Application Layer (Layer 7)
📌 The interface between the user and the network, handling application-level protocols.

📌 Common Protocols:
    HTTP/HTTPS (Web Browsing)
    FTP (File Transfer)
    SMTP/POP3/IMAP (Email)
    DNS (Domain Name System)

📌 Example: Accessing a website via a web browser (HTTP/HTTPS).


- How Data Travels in the OSI Model
    Sender: Data starts at the Application Layer (Layer 7) and moves down through each layer.
    Transmission: Data is sent over a physical medium.
    Receiver: Data moves up from the Physical Layer (Layer 1) to the Application Layer (Layer 7).

### ** SUMMARY **
    - The OSI (Open Systems Interconnection) model is a conceptual framework used to understand and standardize network communication. It consists of seven layers, each with a specific function:
        Physical Layer – Transmits raw data bits over physical hardware like cables and radio waves.
        Data Link Layer – Ensures reliable data transfer between two directly connected devices (MAC & LLC).
        Network Layer – Manages routing and addressing (e.g., IP addresses).
        Transport Layer – Ensures end-to-end communication, error handling, and flow control (e.g., TCP, UDP).
        Session Layer – Manages and controls communication sessions between applications.
        Presentation Layer – Handles data translation, encryption, and compression.
        Application Layer – Provides network services to end users (e.g., HTTP, FTP, SMTP).
        
        
### ** IP ADDRESSES ** 
Class A : 10.0.0.0 - 10.255.255.255
Class B : 172.16.0.0 - 172.31.255.255
Class C : 192.168.0.0 - 192.168.255.255
Class D : 224.0.0.0 – 239.255.255.255 Multicast (One-to-Many Communication) - streaming


### ** traceroute ** 
2️⃣ Understanding the Output
When you run tracert ubuntu.com, you'll see output like:
Tracing route to ubuntu.com [185.125.190.36]
over a maximum of 30 hops:

  1     1 ms     1 ms     2 ms  192.168.1.1  (Local Router)
  2    15 ms    12 ms    13 ms  10.56.0.1  (ISP Gateway)
  3    25 ms    24 ms    26 ms  203.0.113.45 (ISP Backbone)
  4    45 ms    50 ms    47 ms  198.51.100.12 (Regional Internet Exchange)
  5    85 ms    88 ms    90 ms  185.125.190.36 (Ubuntu's Server)
🔹 Each row represents a hop (router) between your computer and the destination.
🔹 Each column shows the response time in milliseconds (ms).
🔹 The final line shows the destination IP (185.125.190.36) for ubuntu.com.

✅ If a hop shows * * *, it means the request timed out—this could be a firewall or blocked ICMP requests.


### ** netstat ** 
- netstat -antp
Running netstat -an might show:

Proto  Local Address        Foreign Address     State
TCP    192.168.1.100:443    203.0.113.45:51234  ESTABLISHED
TCP    192.168.1.100:80     0.0.0.0:0           LISTENING
TCP    127.0.0.1:3306       0.0.0.0:0           LISTENING
UDP    192.168.1.100:53     0.0.0.0:0
🔹 Key Information:

ESTABLISHED → Active connection.
LISTENING → Service is waiting for connections (e.g., a web server).
Foreign Address → The external IP the connection is communicating with.

## lookup commands
 dig <domain.com>
 nmap //
 nslookup //