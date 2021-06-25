# lbry-sync-ytdl

**lbry-sync-ytdl** is a shell script for uploading content to LBRY using [youtube-dl](https://youtube-dl.org/).

* Supports everything that [youtube-dl supports](https://ytdl-org.github.io/youtube-dl/supportedsites.html): can sync YouTube channels, YouTube playlists, SoundCloud audio, Twitch videos, etc.
* Maintains metadata such as descriptions, tags, upload date, author name, license name.
* Choose upload channel and LBC bid amount.

## Disclaimer

Please keep in mind that most content on sites like YouTube is copyrighted. It may be illegal to publish it on LBRY without the creator's permission.

If you want to synchronize your YouTube channel, you should probably use https://lbry.com/youtube instead.

## Usage

Basic usage example:

`lbry-sync-ytdl "https://www.youtube.com/watch?v=dPZTh2NKTm4"`

Will run the script *in test mode* and just show the information that youtube-dl managed to extract. Once you confirm that it's the right information, you can publish it with:

`lbry-sync-ytdl "https://www.youtube.com/watch?v=dPZTh2NKTm4" --bid=1.0`

This will publish the content anonymously.

`lbry-sync-ytdl --channel="@MyAwesomeChannel" "https://www.youtube.com/watch?v=dPZTh2NKTm4" --bid=1.0`

Will publish the content to @MyAwesomeChannel.

**Run** `lbry-sync-ytdl --help` **for more info.**

## Installation

### Arch Linux

Users of Arch-based distos may use the "official" [AUR package](https://aur.archlinux.org/packages/lbry-sync-ytdl/).

### Other UNIX

Go to the [releases page](https://gitlab.com/gardenappl/lbry-sync-ytdl/-/releases) and grab the latest version from there. Extract the archive.

Or just use Git.

Then run:

```
make
sudo make install
```

#### Dependencies

* Either [youtube-dl](https://youtube-dl.org/) or its fork [yt-dlp](https://github.com/yt-dlp/yt-dlp)
* [jq](https://stedolan.github.io/jq/)
* curl
* Perl, for building the man page
* the LBRY app (or a standalone "lbrynet" daemon)

## Known issues

If you're getting an error that looks like this:

`ERROR:   Stream #1:0 -> #0:1 (copy)`

then you might be using an old version of FFmpeg. In that case, try using this option:

`lbry-sync-ytdl --postprocessor-args "-strict -2" ...`

See [issue #4](https://gitlab.com/gardenappl/lbry-sync-ytdl/-/issues/4) for more details.

## Notes

Keep in mind that there might be issues when uploading massive playlists (e.g. more than 50 videos). If you encounter errors during the process:

1. If you succesfully published, say, 30 videos, you may resume the script by providing a youtube-dl option: `--ytdl-options="--playlist-start=30"`
2. It's okay to publish the same video twice, the new one will override the old one. Though you may or may not waste some LBC in the process.
