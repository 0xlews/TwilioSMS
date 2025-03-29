# TwilioSMS

TwilioSMS is a dev tool for experimenting with SMS and testing the Twilio API.

## Note:
This tool is intended strictly for educational and testing purposes. Users must adhere to laws and regulations related to anonymous messaging. While the recipient of the SMS might not know who the sender is, the messages are not truly anonymous...

## Disclaimers:
- TwilioSMS is not designed for any unsolicited messaging or malicious activities.
- The developers are not responsible for any misuse of this tool.
- Twilio assigns a single phone number to your account for all outgoing SMS messages. If you wish to change this number, you must release the current one and purchase a new one through your Twilio account.

## Features:
- A command-line tool for dispatching SMS messages without revealing identity.

## Usage:
Before using TwilioSMS, ensure Git and Python are installed on your system.

### General Steps:
1. Clone the TwilioSMS repository from GitHub:
   ```
   git clone https://github.com/0xlews/TwilioSMS.git
   ```
2. Navigate to the TwilioSMS directory :
   ```
   cd TwilioSMS
   ```
3. Install the required Python dependencies :
   ```
   pip install -r requirements.txt
   ```
4. Add Twilio credentials to `config.ini` : This step involves manually adding your Twilio credentials to a configuration file named config.ini. This is necessary for the TwilioSMS project to interact with the Twilio API.

5. Execute the setup script :
   ```
   bash start.sh
   ```

## SMS Service Integration with Twilio:
TwilioSMS is integrated with Twilio for sending SMS messages. Twilio provides robust support for SMS services and can be extended for email integration in future developments on the paid plan.
