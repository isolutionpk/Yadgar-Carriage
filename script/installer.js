#!/usr/bin/env node

const createWindowsInstaller = require('electron-winstaller').createWindowsInstaller
const path = require('path')
const rimraf = require('rimraf')

deleteOutputFolder()
  .then(getInstallerConfig)
  .then(createWindowsInstaller)
  .catch((error) => {
  console.log('My Error: ', error.message || error)
    console.log(error.message || error)
    process.exit(1)
  })

function getInstallerConfig () {
  const rootPath = path.join(__dirname, '..')
  const outPath = path.join(rootPath, 'out')

  return Promise.resolve({
    appDirectory: path.join(outPath, 'yadgar-carriage-win32-ia32'),
    exe: 'yadgar-carriage.exe',
    iconUrl: 'http://isolution.io/demo/yadgar/resources/assets/images/app-icon/win/app.ico',
    loadingGif: path.join(rootPath, 'assets', 'img', 'loading.gif'),
    noMsi: true,
    outputDirectory: path.join(outPath, 'yadgar-carriage'),
    authors: 'iSolution',
    setupExe: 'YadgarCarriageSetup.exe',
    setupIcon: path.join(rootPath, 'assets', 'app-icon', 'win', 'app.ico'),
    skipUpdateIcon: true
  })
}

function deleteOutputFolder () {
  return new Promise((resolve, reject) => {
    rimraf(path.join(__dirname, '..', 'out', 'yadgar-carriage'), (error) => {
      error ? reject(error) : resolve()
    })
  })
}
