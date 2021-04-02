# Added modules
import telegram

# Project modules
from delivery import send_message as send

MAIN_MENU_KEYBOARD = [[telegram.KeyboardButton('Leituras em andamento')],
                      [telegram.KeyboardButton('ADD novo livro'),
                       telegram.KeyboardButton('Recomendacao')]]


def add_keyboard(update, msg, keyboard):
    """
    Add a new keyboard
    """
    reply_kb_markup = telegram.ReplyKeyboardMarkup(keyboard, resize_keyboard=True)

    # Send the message with the new keyboard
    send(msg, update, reply_kb_markup)


def remove_keyboard(update, msg):
    """
    Remove de current keyboard
    """
    reply_kb_markup = telegram.ReplyKeyboardRemove(remove_keyboard=True)

    # Send the message at the same time the keyboard is removed
    send(msg, update, reply_kb_markup)