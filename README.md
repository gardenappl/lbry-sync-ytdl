# lbry-sync-ytdl

**lbry-sync-ytdl** is a shell script for uploading content to LBRY using [youtube-dl](https://youtube-dl.org/).

* Supports everything that [youtube-dl supports](https://ytdl-org.github.io/youtube-dl/supportedsites.html): can sync YouTube channels, YouTube playlists, SoundCloud audio, Twitch videos, etc.
* Maintains metadata such as descriptions, tags, upload date, author name, license name.
* Choose upload channel and LBC bid amount.

## Usage

Basic usage example:

`lbry-sync-ytdl "https://www.youtube.com/watch?v=dPZTh2NKTm4"`

Will run the script *in test mode* and just show the information that youtube-dl managed to extract. Once you confirm that it's the right information, you can publish it with:

`lbry-sync-ytdl --publish "https://www.youtube.com/watch?v=dPZTh2NKTm4" --bid=1.0`

This will publish the content anonymously.

`lbry-sync-ytdl --publish --channel="@MyAwesomeChannel" "https://www.youtube.com/watch?v=dPZTh2NKTm4" --bid=1.0`

Will publish the content to @MyAwesomeChannel.

It is **highly recommended** that you use the `--optimize-video` option when uploading videos:

`lbry-sync-ytdl --publish --optimize-video --channel="@MyAwesomeChannel" "https://www.youtube.com/watch?v=dPZTh2NKTm4" --bid=1.0`

But **do not use it** for audio files.

**Run** `lbry-sync-ytdl --help` **for more info.**

## Installation

Go to the [releases page](https://gitlab.com/gardenappl/lbry-sync-ytdl/-/releases) and grab the latest stable version from there. Simply download the archive, and put the script somewhere in your PATH.

### Dependencies

* [youtube-dl](https://youtube-dl.org/)
* [jq](https://stedolan.github.io/jq/)
* curl
* the LBRY app (or a standalone "lbrynet" daemon)

## Notes

Keep in mind that there might be issues when uploading massive playlists (e.g. more than 50 videos). If you encounter errors during the process:

1. If you succesfully published, say, 30 videos, you may resume the script by providing a youtube-dl option: `--ytdl-options="--playlist-start=30"`
2. It's okay to publish the same video twice, the new one will override the old one. Though you may or may not waste some LBC in the process.
