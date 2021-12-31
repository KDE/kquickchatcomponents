#pragma once

#include <QObject>

class StandardChatShortcuts : public QObject
{

    Q_OBJECT

    /// The shortcut for "quick switcher" functionality, typically
    /// a KRunner-style search box that lets them hop quickly to
    /// a room by typing its name
    Q_PROPERTY(QString quickSwitcher READ quickSwitcher CONSTANT)

    /// Shortcuts for next and previous "leaf" chats. These are
    /// the lowest level type of chat in a hierarchy,
    /// such as a chat in a folder (Telegram), a room in a space (Matrix),
    /// or a channel in a community (Harmony)
    Q_PROPERTY(QString previousLeaf READ previousLeaf CONSTANT)
    Q_PROPERTY(QString nextLeaf READ nextLeaf CONSTANT)

    /// Shortcuts for next and previous "top level" chats. These are
    /// the lowest level type of chat in a hierarchy,
    /// such as a folder containing chats Telegram), 
    /// a space containing rooms (Matrix),
    /// or a community containing channels (Harmony)
    Q_PROPERTY(QString previousTopLevel READ previousTopLevel CONSTANT)
    Q_PROPERTY(QString nextTopLevel READ nextTopLevel CONSTANT)

    /// A shortcut to open an emoji picker associated with a text field
    Q_PROPERTY(QString emojiPicker READ emojiPicker CONSTANT)

    /// A shortcut to edit the last message sent by this sender
    Q_PROPERTY(QString editLastMessage READ editLastMessage CONSTANT)

public:

    explicit StandardChatShortcuts(QObject* object = nullptr);
    ~StandardChatShortcuts();

    QString quickSwitcher() const;
    QString previousLeaf() const;
    QString nextLeaf() const;
    QString previousTopLevel() const;
    QString nextTopLevel() const;
    QString emojiPicker() const;
    QString editLastMessage() const;

};