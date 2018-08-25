function top -d "Display processes"

  set command_alternatives htop top
  # Command specific parameters
  #set top ""

  for i in (seq (count $command_alternatives))
    set alternative $command_alternatives[$i]
    if command_exists $alternative
      set args $$command_alternatives[$i]
      eval (which $alternative) $args $argv 2>/dev/null
      break
    end
  end
end
