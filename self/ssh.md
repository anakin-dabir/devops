### Key Type

ssh-keygen -t rsa # Generates an RSA key (default)
ssh-keygen -t ed25519 # Generates an Ed25519 key (preferred for modern usage)
ssh-keygen -t ecdsa # Generates an ECDSA key

- Specify the Key Size
  ssh-keygen -b 4096 # Use 4096 bits for RSA keys (stronger security)
  ssh-keygen -t rsa -b 2048 # Default size for RSA is 2048 bits

- Custom Key Location
  ssh-keygen -f ~/.ssh/my_custom_key

- Comment in the Public Key Add a comment to identify the key:
  ssh-keygen -t rsa -C "your_email@example.com"

### Adding Your Key to Remote Servers

- After generating the key pair, copy the public key to the remote server (e.g., for passwordless SSH login):
  ssh-copy-id -i ~/.ssh/id_rsa.pub user@remote_host

- OR
  cat ~/.ssh/id_rsa.pub | ssh user@remote_host "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"

- in this way we can be able to directly login with the help of our private key stored in ~/.ssh/id_rsa
  ssh user@remote_host # basically it is ssh -i ~/.ssh/id_rsa user@remote_hos

### Optional: Managing Multiple SSH Keys

If you use multiple SSH keys (e.g., one for GitHub and one for EC2), you may need to tell SSH which key to use for specific hosts.

- Edit the SSH Config File
  Add an entry to your SSH config file (~/.ssh/config) for easier management:
- nano ~/.ssh/config

  - Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa

  - Host ec2
    HostName <ec2-public-ip>
    User ec2-user
    IdentityFile ~/.ssh/id_rsa

### PEM APPROACH

The .pem approach is commonly used in cloud environments like AWS EC2. Here's how you can implement this approach in your scenario:

1. Understand the .pem File
   The .pem file is simply a private key.
   It works with a corresponding public key stored in the remote machine's ~/.ssh/authorized_keys file.
   When you share the .pem file with a user, they use it to authenticate via SSH.
2. Implementing the .pem Approach
   Step 1: Generate the Key Pair
   You can generate the private-public key pair (.pem file and public key) on your local machine or a secure environment.

- Generate Key Pair:
  ssh-keygen -t rsa -b 4096 -m PEM -f my-server-key
  -t rsa: Specifies the RSA algorithm.
  -b 4096: Sets the key size to 4096 bits (stronger security).
  -m PEM: Outputs the private key in .pem format.
  -f my-server-key: The base name for the key files.
- This will create two files:
  Private Key: my-server-key (convert to .pem if needed).
  Public Key: my-server-key.pub.
- Convert Private Key to .pem Format (if necessary): If your private key is not already in .pem format:
  openssl rsa -in my-server-key -outform PEM -out my-server-key.pem

**Step 2: Configure the Public Key on the Remote Machine**

- Add the public key (my-server-key.pub) to the authorized_keys file of the user on the remote machine.

  ssh root@<machine-ip> "mkdir -p ~/.ssh && echo '$(cat my-server-key.pub)' >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys"
  This ensures the public key is stored securely on the remote server and associated with the user account.

**Step 3: Share the .pem File**

- Provide the private key (e.g., my-server-key.pem) to the user securely.
  Use a secure file-sharing method, such as encrypted email, password-protected file transfer, or cloud services with restricted access. 3. User Access with the .pem File
  The user can access the machine using the .pem file:

- Ensure the .pem file has the correct permissions:
  chmod 400 my-server-key.pem
  Log in to the machine using SSH:

- ssh -i my-server-key.pem user@<machine-ip>

- Pros:

  - Secure:
    The private key is never stored on the server, only the public key.
    Users authenticate securely without passwords.
  - Simple:
    No need for users to generate their own keys or configure SSH.
  - Cloud-Compatible:
    Aligns with AWS EC2's key pair-based access model.
    Cons:
  - Key Management:
    If multiple users need access, you must manage multiple .pem files or keys.
    Misplacing the .pem file can lock the user out (if no backup exists).
  - Access Revocation:
    If you need to revoke access for a user, you must manually remove the associated public key from the server's authorized_keys file. 5. Improving the .pem Workflow
  - Centralized User Access:
    Use a tool like AWS IAM (for EC2) or LDAP for managing user access.
  - Limit Permissions:
    Restrict access to the .pem file with strict permissions:
    chmod 400 my-server-key.pem
  - Rotate Keys:
    Periodically replace the .pem file and update the public key on the server for enhanced security. 6. Revoking Access

    - If you need to revoke a user's access:
      Identify the user's public key in the ~/.ssh/authorized_keys file.
    - Remove the corresponding line:
      nano ~/.ssh/authorized_keys
    - Save the file and ensure permissions remain intact:
      chmod 600 ~/.ssh/authorized_keys

- Summary
  The .pem file is the private key used for SSH authentication, while the public key resides on the server.
  To implement .pem-based access:
  Generate the key pair and store the public key on the server.
  Share the private key securely with the user.
  Users authenticate with the .pem file using SSH.
  For better security, combine .pem-based access with tools like centralized IAM, key rotation, and secure key sharing practices.
