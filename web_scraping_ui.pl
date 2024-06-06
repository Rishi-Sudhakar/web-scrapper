#!/usr/bin/perl
use strict;
use warnings;
use Tk;
use LWP::Simple;
use HTML::TreeBuilder;

# Create main window
my $mw = MainWindow->new;
$mw->title("Web Scraping");

# Create URL entry box
my $url_label = $mw->Label(-text => "Enter URL:");
$url_label->pack(-side => 'top');
my $url_entry = $mw->Entry()->pack(-side => 'top');

# Create "Scrape" button
my $scrape_button = $mw->Button(
    -text    => "Scrape",
    -command => \&scrape_website
);
$scrape_button->pack(-side => 'top');

# Subroutine to scrape website and save content to file
sub scrape_website {
    my $url = $url_entry->get();
    my $content = get($url);

    if ($content) {
        my $tree = HTML::TreeBuilder->new_from_content($content);
        my $text = $tree->as_text;

        # Save scraped content to a text file
        my $output_file = "scraped_content.txt";
        open(my $fh, '>', $output_file) or die "Cannot open file '$output_file' for writing: $!";
        print $fh $text;
        close($fh);

        # Display success message
        $mw->messageBox(
            -message => "Website scraped successfully!\nContent saved to $output_file",
            -type    => 'ok'
        );
    } else {
        # Display error message if URL is invalid or website is unreachable
        $mw->messageBox(
            -message => "Failed to scrape website. Please check the URL and try again.",
            -type    => 'ok',
            -icon    => 'error'
        );
    }
}

# Start GUI event loop
MainLoop;
