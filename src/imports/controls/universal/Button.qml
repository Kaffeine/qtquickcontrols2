/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Quick Controls 2 module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.9
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import QtQuick.Controls.Universal 2.3

T.Button {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             contentItem.implicitHeight + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    padding: 8
    topPadding: padding - 4
    bottomPadding: padding - 4
    spacing: 8

    icon.width: 20
    icon.height: 20
    icon.color: enabled ? undefined : Color.transparent(Universal.foreground, 0.2)

    property bool useSystemFocusVisuals: true

    contentItem: DisplayLayout {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: IconImage {
            id: iconImage
            name: control.icon.name
            source: control.icon.source
            sourceSize.width: control.icon.width
            sourceSize.height: control.icon.height
            color: control.icon.color
        }
        text: Text {
            text: control.text
            font: control.font
            elide: Text.ElideRight
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            opacity: enabled ? 1.0 : 0.2
            color: control.Universal.foreground
        }
    }

    background: Rectangle {
        implicitWidth: 32
        implicitHeight: 32

        visible: !control.flat || control.down || control.checked || control.highlighted
        color: control.down ? control.Universal.baseMediumLowColor :
               control.enabled && (control.highlighted || control.checked) ? control.Universal.accent :
                                                                             control.Universal.baseLowColor

        Rectangle {
            width: parent.width
            height: parent.height
            color: "transparent"
            visible: control.hovered
            border.width: 2 // ButtonBorderThemeThickness
            border.color: control.Universal.baseMediumLowColor
        }
    }
}
