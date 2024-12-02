global.owner = ['6283852406727', '628895154319']  
global.mods = ['6283852406727', '628895154319'] 
global.prems = ['6283852406727', '628895154319']
global.nameowner = ['V.S.L', 'ikyy']
global.numberowner = ['6283852406727', '628895154319']
global.mail = 'support@vsl.eu.org' 
global.gc = 'https://chat.whatsapp.com/Kh1kOsK33GCEohpf7ezrVs'
global.instagram = 'https://instagram.com'
global.wm = '© V.S.L'
global.wait = '_*Tunggu sedang di proses...*_'
global.eror = '_*Server Error*_'
global.stiker_wait = '*⫹⫺ Stiker sedang dibuat...*'
global.packname = 'Made With'
global.author = 'Bot WhatsApp'
global.maxwarn = '2' // Peringatan maksimum
global.antiporn = true // Auto delete pesan porno (bot harus admin)

//INI WAJIB DI ISI!//
global.lann = 'uap9bIrs' 
//Daftar terlebih dahulu https://api.betabotz.eu.org

//INI OPTIONAL BOLEH DI ISI BOLEH JUGA ENGGA//
global.btc = 'YlRELIoT'
//Daftar https://api.botcahx.eu.org 

global.APIs = {   
  lann: 'https://api.betabotz.eu.org',
  btc: 'https://api.botcahx.eu.org'
}
global.APIKeys = { 
  'https://api.betabotz.eu.org': 'APIKEY', 
  'https://api.botcahx.eu.org': 'APIKEY'
}

let fs = require('fs')
let chalk = require('chalk')
let file = require.resolve(__filename)
fs.watchFile(file, () => {
  fs.unwatchFile(file)
  console.log(chalk.redBright("Update 'config.js'"))
  delete require.cache[file]
  require(file)
})
