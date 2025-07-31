# Catppuccin Mocha Theme for Spicetify
$colors = @{
    text               = "f5e0dc"
    subtext            = "a6adc8"
    main               = "1e1e2e"
    'main-elevated'    = "181825"
    highlight          = "313244"
    'highlight-elevated' = "45475a"
    sidebar            = "11111b"
    player             = "1e1e2e"
    card               = "313244"
    shadow             = "000000"
    'selected-row'     = "89b4fa"
    button             = "8aadf4"
    'button-active'    = "89b4fa"
    'button-disabled'  = "585b70"
    'tab-active'       = "89b4fa"
    notification       = "94e2d5"
    'notification-error' = "f38ba8"
    misc               = "6c7086"
    accent             = "cba6f7"
    'accent-active'    = "f5c2e7"
    'accent-inactive'  = "1e1e2e"
    banner             = "f38ba8"
    'border-active'    = "cba6f7"
    'border-inactive'  = "45475a"
    header             = "313244"
}

foreach ($key in $colors.Keys) {
    spicetify color $key $($colors[$key])
}

spicetify apply

