﻿/*
 * Copyright (c) 2015 Nikolay Zapolnov (zapolnov@gmail.com)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#pragma once
#include "ui_MainWindow.h"
#include "Project.h"
#include <memory>
#include <QWidget>

class MainWindow : public QWidget, private Ui_MainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget* parent = nullptr);
    ~MainWindow();

protected:
    void closeEvent(QCloseEvent* event) override;

private:
    std::unique_ptr<Project> m_Project;
    bool m_LoadingProject = false;
    QWidget* m_CurrentEditor = nullptr;
    QString m_FileName;

    bool saveIfNeeded();

    Q_SLOT void on_uiNewFileButton_clicked();
    Q_SLOT void on_uiOpenFileButton_clicked();
    Q_SLOT bool on_uiSaveFileButton_clicked();

    Q_SLOT void on_uiAddRuleButton_clicked();
    Q_SLOT void on_uiRemoveRuleButton_clicked();

    Q_SLOT void on_uiDraftBuildButton_clicked();
    Q_SLOT void on_uiFinalBuildButton_clicked();
    Q_SLOT void on_uiCleanButton_clicked();

    Q_SLOT void on_uiRuleList_itemSelectionChanged();

    Q_SLOT void onRuleCreated(Rule* rule);
    Q_SLOT void onRuleDeleted(Rule* rule);

    Q_SLOT void updateUI();
};
