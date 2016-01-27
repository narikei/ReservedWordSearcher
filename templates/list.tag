<list>
  <ul class="language-list">
    <li each="{languages}" class="language-list__item {is-active: active}" style="background-color:{color};color:{textColor}" onclick="{parent.toggle}">
      {name}
    </li>
  </ul>

  <script>
    var self = this
    this.languages = window.RWS.languages

    this.toggle = function(e) {
      e.item.active = !e.item.active
      self.update();
    }
  </script>

</list>
