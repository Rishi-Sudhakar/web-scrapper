# Use the official Perl image as the base image
FROM perl:latest

# Install X11 and Tk dependencies
RUN apt-get update && apt-get install -y \
    xorg \
    libx11-dev \
    libxt-dev \
    libxft-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Perl modules using cpanm
RUN cpan App::cpanminus \
    && cpanm Tk LWP::Simple HTML::TreeBuilder

# Install X11 server and utilities for X11 forwarding
RUN apt-get update && apt-get install -y \
    xauth \
    x11-apps \
    && rm -rf /var/lib/apt/lists/*

# Set environment variable for X11 forwarding
ENV DISPLAY=:0

# Set working directory
WORKDIR /app

# Copy Perl script into the container
COPY web_scraping_ui.pl /app/

# Define startup command
CMD ["perl", "web_scraping_ui.pl"]
