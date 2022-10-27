local Translations = {

    error = {
        paltedot = 'You cannot change the plate while on the move!',
        platedot2 = 'You cannot change the license plate while Outside the Vehicle!',
        cooldown = 'You Cant Use This Item So Fast!',
        platenot = 'There is no fake license plate attached to the vehicle!',
        plateinstalled = 'Fake License Plate Already Installed on Vehicle'
    },

    success = {
        youputtheplate = 'Installed the original license plate of the vehicle',
        platechanged = 'You changed the license plate of the vehicle!'

    },

    progress = {
        changeplate = 'Plate is Changing',
        plateremoving = 'Plate Removing'

        }
    }

    Lang = Lang or Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })