local Translations = {

    error = {
        paltedot = 'U kunt uw kentekenplaat nit varanderen al je aan het rijden bent!',
        platedot2 = 'U kunt de kentekenplaat niet wijzigen terwijl u zich buiten het voertuig bevindt!',
        cooldown = 'U kunt dit item niet zo snel gebruiken!',
        platenot = 'Er is geen valse kentekenplaat aan het voertuig gemonteerd!',
        plateinstalled = 'Een valse kentekenplaat al op voertuig gemonteerd'
    },

    success = {
        youputtheplate = 'De originele kentekenplaat van het voertuig is gemonteerd',
        platechanged = 'U heeft het kenteken van het voertuig gewijzigd!'

    },

    progress = {
        changeplate = 'Kenteken aan het veranderen',
        plateremoving = 'Kenteken aan het verwijderen'

        }
    }

    if GetConvar('qb_locale', 'en') == 'nl' then
        Lang = Locale:new({
            phrases = Translations,
            warnOnMissing = true,
            fallbackLang = Lang,
        })
    end
