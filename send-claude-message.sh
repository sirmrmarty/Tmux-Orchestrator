#!/bin/bash

# Send message to Claude agent in tmux window
# Usage: send-claude-message.sh <session:window> <message>

if [ $# -lt 2 ]; then
    echo "Usage: $0 <session:window> <message>"
    echo "Example: $0 agentic-seek:3 'Hello Claude!'"
    exit 1
fi

WINDOW="$1"
shift  # Remove first argument, rest is the message
MESSAGE="$*"

# Validate window format (session:window or session:window.pane)
if ! [[ "$WINDOW" =~ ^[a-zA-Z0-9_-]+:[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Invalid window format. Expected format: session:window or session:window.pane" >&2
    echo "Example: my-session:0 or my-session:0.1" >&2
    exit 1
fi

# Check if the tmux target exists
if ! tmux list-panes -t "$WINDOW" >/dev/null 2>&1; then
    echo "Error: Tmux target '$WINDOW' does not exist" >&2
    echo "Available sessions:" >&2
    tmux list-sessions 2>/dev/null || echo "  No tmux sessions found" >&2
    exit 1
fi

# Validate message is not empty
if [ -z "$MESSAGE" ]; then
    echo "Error: Message cannot be empty" >&2
    exit 1
fi

# Send the message
if ! tmux send-keys -t "$WINDOW" "$MESSAGE" 2>/dev/null; then
    echo "Error: Failed to send message to $WINDOW" >&2
    exit 1
fi

# Wait 0.5 seconds for UI to register
sleep 0.5

# Send Enter to submit
if ! tmux send-keys -t "$WINDOW" Enter 2>/dev/null; then
    echo "Error: Failed to send Enter key to $WINDOW" >&2
    exit 1
fi

echo "Message sent to $WINDOW: $MESSAGE"