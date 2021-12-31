#include "standardshortcuts.h"

StandardChatShortcuts::StandardChatShortcuts(QObject* object) : QObject(object)
{

}

StandardChatShortcuts::~StandardChatShortcuts()
{

}

// a lil' macro to reduce the boilerplate from the large amounts of
// constant properties
#define constProp(name, val) QString StandardChatShortcuts :: name () const { return val; }

constProp(quickSwitcher, "Ctrl+K")
constProp(previousLeaf, "Alt+Up")
constProp(nextLeaf, "Alt+Down")
constProp(previousTopLevel, "Ctrl+Shift+Tab")
constProp(nextTopLevel, "Ctrl+Tab")
constProp(emojiPicker, "Ctrl+E")
constProp(editLastMessage, "Up")