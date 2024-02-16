import configparser
from twilio.rest import Client
from twilio.base.exceptions import TwilioRestException
import logging

# Set up logging
logging.basicConfig(filename='app.log', filemode='w', format='%(name)s - %(levelname)s - %(message)s', level=logging.DEBUG)

def send_sms(to, message):
    try:
        # Read the Twilio API credentials from the config file
        config = configparser.ConfigParser()
        config.read('config.ini')

        account_sid = config['TWILIO']['account_sid']
        auth_token = config['TWILIO']['auth_token']
        twilio_number = config['TWILIO']['twilio_number']

        client = Client(account_sid, auth_token)
        message = client.messages.create(
            body=message,
            from_=twilio_number,
            to=to
        )
        logging.info(f"Message sent successfully with SID: {message.sid}")
        return message.sid
    except TwilioRestException as e:
        logging.error(f"TwilioRestException: {e}")
        raise
    except Exception as e:
        logging.error(f"Unexpected error: {e}")
        raise

if __name__ == "__main__":
    try:
        # Get the recipient's country code, phone number and message from the user
        country_code = input("Enter the recipient's country code e.g. +44 : ")
        if not country_code.startswith('+'):
            country_code = '+' + country_code
        to_number = input("Enter the recipient's phone number: ")
        if to_number.startswith('0'):
            to_number = to_number.lstrip('0')
        to_number = f"{country_code}{to_number}"
        message_body = input("Enter your message: ")
        message_sid = send_sms(to_number, message_body)

        # Print the SID of the message or an error message
        if message_sid:
            print(f"Message sent successfully. SID: {message_sid}")
        else:
            print("Message failed to send.")

    # Handle any unexpected errors
    except Exception as e:
        print(f"Unexpected Error: {e}")
