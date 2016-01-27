<search>
  <input type="text" onkeyup="{search}" />

  <ul class="word_list">
    <li each="{words}" class="word_item">
      {lang.name}:
      {word}
    </li>
  </ul>

  <script>
    var self = this
    self.words = []

    self.search = function(e) {
      var value = e.target.value || ""
      value = value.toLowerCase()

      console.log(value)

      self.words = []

      for (i in window.RWS.languages) {
        var language = window.RWS.languages[i]
        if (language.active) {
          var keywords = window.RWS.keywords[language.key]
          for (j in keywords) {
            var word = keywords[j]
            var indexOf = word.toLowerCase().indexOf(value)
            if (indexOf > -1) {
              self.words.push({
                lang: language,
                word: word,
                indexOf: indexOf,
              })
            }
          }
        }
      }

      self.words = self.words.sort(function(a, b) {
        if (a.word.toLowerCase() == value) {
          return -1
        }
        if (a.indexOf < b.indexOf) {
          return -1
        }
        if (a.word < b.word) { return -1 }
      	if (a.word > b.word) { return 1 }
      	return 0
      })
    }
  </script>
</search>
