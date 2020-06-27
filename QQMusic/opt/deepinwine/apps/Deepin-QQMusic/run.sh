#!/bin/bash

#   Copyright (C) 2016 Deepin, Inc.
#
#   Author:     Li LongYu <lilongyu@linuxdeepin.com>
#               Peng Hao <penghao@linuxdeepin.com>
#               gorquan <gorquan@gmail.com>

BOTTLENAME="Deepin-QQMusic"
APPVER="17.66"
APPDIR="/opt/deepinwine/apps/${BOTTLENAME}"
APPTAR="files.7z"
WINEPREFIX="${HOME}/.deepinwine/${BOTTLENAME}"
WINE_CMD="deepin-wine"

export LC_CTYPE='en_US.UTF-8'

if command -v zenity >/dev/null 2>&1; then
	progressbar()
	{
		WINDOWID="" zenity --progress --title="$1" --text="$2" --pulsate --width=400 --auto-close --no-cancel ||
		WINDOWID="" zenity --progress --title="$1" --text="$2" --pulsate --width=400 --auto-close
	}

else
	progressbar()
	{
		cat -
	}
fi

Extract_APP()
{
    mkdir -p "${WINEPREFIX}"
    7z x "${APPDIR}/${APPTAR}" -o"${WINEPREFIX}"
    mv "${WINEPREFIX}/drive_c/users/@current_user@" "${WINEPREFIX}/drive_c/users/$USER"
    sed -i "s#@current_user@#$USER#" ${WINEPREFIX}/*.reg
}

Deploy_APP()
{
    Extract_APP
    echo "${APPVER}" > "${WINEPREFIX}/PACKAGE_VERSION"
}

FIX_LINK()
{
    if [ -d ${WINEPREFIX} ]; then
        cd "${WINEPREFIX}/dosdevices"
        rm c: z:
        ln -s -f ../drive_c c:
        ln -s -f / z:
    fi
}

CALL_APP()
{
    FIX_LINK
    /opt/deepinwine/tools/kill.sh QQMusic.exe block
    if [ -a "$ConfigInfoXML1Path" ]; then
        rm "$ConfigInfoXML1Path"
    fi
    if [ -a "$_ConfigInfoXML1Path" ]; then
        rm "$_ConfigInfoXML1Path"
    fi
    env WINEPREFIX="${WINEPREFIX}" ${WINE_CMD} "c:\\Program Files\\Tencent\\QQMusic\\QQMusic.exe" &
}

RUN_APP()
{
    progpid=$(ps -ef | grep "zenity --progress --title=${BOTTLENAME}" | grep -v grep)
    if [ -n "$progpid" ]; then
        exit 0
    fi
    if [ ! -d "${WINEPREFIX}" ]; then
        Deploy_APP | progressbar ${BOTTLENAME} "初始化${BOTTLENAME}中..."
    fi
    CALL_APP
}

RUN_APP