<search>
  <input class="serchbox" type="text" onkeyup="{search}" placeholder="Searche..." autofocus />

  <ul class="word-list">
    <li each="{words}" class="word-list__item" style="border-left-color:{lang.color}">
      <div class="word-list__item__lang">{lang.name}</div>
      <div class="word-list__item__word">{word}</div>
    </li>
  </ul>

  <script>
    var self = this
    self.words = []

    self.search = function(e) {
      searchWord(e.target.value)
    }

    function searchWord(value) {
      if (2 > value.length) {
        return
      }
      value = value.toLowerCase()

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
