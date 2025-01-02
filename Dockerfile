# Start from the BusyBox image (minimal and reliable)
FROM busybox:latest

# Set environment variables (optional, if you want to configure the environment)
ENV TEST_ENV="development"
ENV APP_NAME="TestApp"

# Add a script that will be executed on container startup
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Set the default command to run the script
CMD ["/start.sh"]
