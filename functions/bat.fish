function bat -d "a cat with wings"
  set FOUND 0
  set COMMAND_ALTERNATIVES bat batcat cat
  set -x BAT_THEME Nord

  # Command specific parameters
  set bat " --style numbers,changes"

  for i in (seq (count $COMMAND_ALTERNATIVES))
    set ALTERNATIVE $COMMAND_ALTERNATIVES[$i]
    if command_exists $ALTERNATIVE
      set FOUND 1
      set args $$COMMAND_ALTERNATIVES[$i]
      eval (which $ALTERNATIVE) $args $argv 2>/dev/null
      break
    end
  end

  test "$FOUND" = 0; and echo "No suitable command found"
end
