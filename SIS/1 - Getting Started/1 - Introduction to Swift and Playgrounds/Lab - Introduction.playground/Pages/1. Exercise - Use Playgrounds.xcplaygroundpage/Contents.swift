/*:
 ## Exercise - Use Playgrounds

 The code below prints a few short statements about what you have learned in this lesson. Open the console area and view the code's output.
 */
print("I have learned the following:")
print("What features make Swift a modern and safe language")
print("How to use the Swift REPL in Terminal")
print("How to use playgrounds to make writing Swift fun and simple")
/*:
 Now print your own phrases to the console. Pick one of your favorite songs. Use your knowledge of the `print` function to display the song title and artist.
 */
func printFavoriteSong(title: String, artist: String) {
    print("The name of my favorite song is '\(title)' by \(artist).")
}
printFavoriteSong(title: "Sparking Tekken 5", artist: "Tom Leonard.")

/*:
 Use multiple `print` functions to write out some of the lyrics to the song.
 */
func printLyrics(lyrics: [String]) {
    for line in lyrics {
        print(line)
    }
}

let songLyrics = [
    "I'm here now; I'm doing the best I can.",
    "Where are you now? Did your dreams come true?",
    "Here we go...",
    "Sparking!"
]

printLyrics(lyrics: songLyrics)
/*:

 _Copyright © 2021 Apple Inc._

 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_

 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._

 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 */
