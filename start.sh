#!/bin/sh

echo "Environment: $TEST_ENV"
echo "App Name: $APP_NAME"

# Run some dummy tests or commands
echo "Running dummy test..."
sleep 2
echo "Test completed successfully!"

# Keep the container running (for testing purposes)
tail -f /dev/null
