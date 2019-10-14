#!/usr/bin/env node

const createWindowsInstaller = require('electron-winstaller').createWindowsInstaller
const path                   = require('path')
const rimraf                 = require('rimraf')

deleteOutputFolder()
    .then(getInstallerConfig)
    .then(createWindowsInstaller)
    .catch((error) => {
        console.log('My Error: ', error.message || error)
        console.log(error.message || error)
        process.exit(1)
    })

function getInstallerConfig() {
    const rootPath = path.join(__dirname, '..')
    const outPath  = path.join(rootPath, 'out')

    return Promise.resolve({
        appDirectory: path.join(outPath, 'YadgarCarriage-win32-ia32'),
        exe: 'YadgarCarriage.exe',
        iconUrl: 'http://yadgarcarriage.com/demo/yadgar/resources/assets/images/app-icon/win/app.ico',
        loadingGif: path.join(rootPath, 'assets', 'img', 'loading.gif'),
        noMsi: true,
        outputDirectory: path.join(outPath, 'YadgarCarriage'),
        setupIcon: path.join(rootPath, 'assets', 'app-icon', 'win', 'app.ico'),
        skipUpdateIcon: true,
        setupExe: 'YadgarCarriageSetup.exe',
        // remoteReleases: 'https://github.com/isolutionpk/Yadgar-Carriage/releases/latest',
        // remoteToken: '0416316b9c59b2e7cddb4669328deccf6d90af76',
        authors: 'iSolution'
    })
}

function deleteOutputFolder() {
    return new Promise((resolve, reject) => {
        rimraf(path.join(__dirname, '..', 'out', 'YadgarCarriage'), (error) => {
            error ? reject(error) : resolve()
        })
    })
}
