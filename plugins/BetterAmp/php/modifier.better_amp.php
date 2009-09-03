<?php
  function smarty_modifier_better_amp($text) {
    return preg_replace("/&(?!#?[xX]?(?:[0-9a-fA-F]+|\w{1,8});)/i","<span class='amp'>&amp;</span>",$text);
  }
?>