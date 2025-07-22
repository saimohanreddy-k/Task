# Use lightweight Linux base
FROM alpine:latest

# Set working directory
WORKDIR /app

# Copy abc.sh into container
COPY abc.sh .

# Give read, write, execute permission to user, group, others (777)
RUN chmod 777 abc.sh

# Default command to keep container alive
CMD ["sh"]

