FROM danachim/netlify-cli:latest

# Add the entrypoint script
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Add the build directory
ADD build /build

# Define the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
