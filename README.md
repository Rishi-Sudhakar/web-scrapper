# web-scrapper

A `web scraping software`, that allows to fetch text from url specified and saves it in text format, Made with perl.

## Installation

Make sure your system has perl installed,

```bash
perl -v
```

To know the location at which it is installed
```bash
which perl
```

For `MacOS` , Homebrew is recommended for `perl` installation,
```bash
brew install perl
```
Now, use `cpan` to install required packages,
```bash
cpan Tk
```
```bash
cpan LWP::Simple
```
```bash
cpan HTML::TreeBuilder
```

while installing, `sudo` is recommended to be added before `cpan` to install the modules globally. You can also use `cpanm` for the installation.

Now you can run,

```bash
perl web_scraping_ui.pl
```

For MacOS, you will need a software for enabling gui,
```bash
brew install xquartz
```

or you can just use the dockerfile and build with it,

```bash
docker build -t perl-tk .
```
>( **_Note:_** The "." is mandatory)
## Working

* The `scrape_website` subroutine retrieves the URL entered by the user from the entry widget using the `get` method. Then, it uses the `get` function from LWP::Simple to fetch the content of the webpage.

* If the content is successfully retrieved, the subroutine creates an HTML::TreeBuilder object and parses the content using the `new_from_content` method. It then extracts the text from the parsed HTML using the `as_text` method.

* The scraped content is saved to a text file named "scraped_content.txt" using the `open`, `print`, and `close` functions.

* If the content retrieval fails (e.g., due to an invalid URL or an unreachable website), an error message is displayed using the `messageBox` method.

* Finally, the script enters the GUI event loop using the `MainLoop` function, which starts the execution of the GUI and waits for user interactions.

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

