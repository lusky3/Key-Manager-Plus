# Key-Manager-Plus
Docker Image for ManageEngine's Key Manager Plus.

## About
"ManageEngine Key Manager Plus is a web-based key management solution that helps you consolidate, control, manage, monitor, and audit the entire life cycle of SSH (Secure Shell) keys and SSL (Secure Sockets Layer) certificates. It provides visibility into the SSH and SSL environments and helps administrators take total control of the keys to preempt breaches and compliance issues."

https://www.manageengine.com/key-manager/

## Install Notes
The application runs on port 6565.

After building the image, access the web interface via https://<your IP / hostname>:6565

The default login is admin/admin.

## Docker Configuration

docker run -d \
    --name key-manager-plus \
    -v /data:/path/to/data \
    lusky3/key-manager-plus:latest

## Editions & Licensing
The following is ManageEngine's license options.

Evaluation | Free | Standard
--- | --- | ---
Manage upto 50 keys*  | Valid forever  |  Licensing is based on the number of managed keys*
Valid for 30-days. Automatically turns into free edition at the end of the trial. |  Manage upto 5 keys* | 

_*The term 'Keys' refers to the number of SSH private keys plus SSL certificates plus any other digital key being managed._

See [ManageEngine's site](https://www.manageengine.com/key-manager/) for additional info.

## Acknowledgements
I did not create Key Manager Plus. I simply packaged it into a docker image for personal testing.
