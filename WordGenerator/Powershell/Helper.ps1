Function Is-Numeric ($str) {
    return $str -match '^[\d\.]+$'
}

Function Clean-Text($text) {
    @(' ', '​', '\(', '\)', '\~', '\!', '\@', '\#', '\$', '\%', '\^', 'ˆ', 'ˇ', '\&', '\*', '\-', '_', '\=', '\+', ',', '\.', '\?', '\[', '\]', '\{', '\}', '\|', '\:', ';', ' ', '\s+', '\/', '''', '–', '\\', '¨', '‘‘', '‘’', '«', '»', '¤', '<', '>', '^[\d\.]+$', '‚‚', '”', '“', '…', '"', '„', '°', '·', '•', '‰', '—', '→', '\d') | % {
        $text = $text -replace "$_", ""
    }
    return $text
}

Function Is-Valid-Word($word) {
    return ([string]::IsNullOrEmpty($word) -eq $false) -and ((Is-Numeric $word) -eq $false)
}


Function Convert-TawizaToLatin([string]$text) {
    $firstStepReplaces = @{'ttv' = 'ṭṭ'; 'ssv' = 'ṣṣ'; 'zzv' = 'ẓẓ'; 'ddv' = 'ḍḍ'; 'rrv' = 'ṛṛ'}

    $secondeStepReplaces = @{'kw' = 'kʷ'; 'gw' = 'gʷ'; 'gh' = 'γ'; 'tv' = 'ṭ'; 'sv' = 'ṣ'; 'zv' = 'ẓ'; 'dv' = 'ḍ'; 'rv' = 'ṛ'; 'dj' = 'ǧ'; 'h' = 'ḥ'; 'o' = 'ε'; 'p' = 'h'; 'tc' = 'č'}

    foreach ($key in $firstStepReplaces.Keys) {
        $text = $text -replace $key, $firstStepReplaces[$key]
    }

    foreach ($key in $secondeStepReplaces) {
        $text = $text -replace $key, $secondeStepReplaces
    }

    return $text
}

Function Convert-TifinaghToLatin([string]$text) {
    $replaces = @{
        'ⴰ' = 'a'; 'ⴱ' = 'b'; 'ⵛ' = 'c'; 'ⵞ' = 'č'; 'ⴷ' = 'd'; 'ⴹ' = 'ḍ'; 'ⴻ' = 'e'; 'ⵄ' = 'ɛ'; 'ⴼ' = 'f'; 'ⴳ' = 'g'; 'ⴵ' = 'ǧ'; 'ⵖ' = 'ɣ'; 'ⵀ' = 'h'; 'ⵃ' = 'ḥ'; 'ⵉ' = 'i'; 'ⵊ' = 'j'; 'ⴽ' = 'k'; 'ⵍ' = 'l'; 'ⵎ' = 'm'; 'ⵏ' = 'n'; 'ⵇ' = 'q'; 'ⵔ' = 'r'; 'ⵕ' = 'ṛ'; 'ⵙ' = 's'; 'ⵚ' = 'ṣ'; 'ⵜ' = 't'; 'ⵟ' = 'ṭ'; 'ⵓ' = 'u'; 'ⵡ' = 'w'; 'ⵅ' = 'x'; 'ⵢ' = 'y'; 'ⵣ' = 'z'; 'ⵥ' = 'ẓ';     
    }

    foreach ($key in $replaces.Keys) {
        $text = $text -replace $key, $replaces[$key]
    }

    return $text
}
