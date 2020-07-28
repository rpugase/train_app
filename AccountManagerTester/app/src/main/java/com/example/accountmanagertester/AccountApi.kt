package com.example.accountmanagertester

import android.accounts.AccountManager
import android.content.Context

/**
 * TODO LIST
 * 1. Дата класс лицензии
 * 2. Метод для добавления одного объекта лицензии
 * 3. Получения списка лицензий и сохранение в мапу с <String:pssh, License:license>
 */
class AccountApi(context: Context) {

    private val accType = "com.infomir.ministra"

    private val keyDrmLicense = "DrmLicenses"

    private val accountManager = AccountManager.get(context)
    val currentAccount = accountManager.getAccountsByType(accType).first()
    private val licenses = mutableMapOf<String, License>()

    private fun getLicenses() {

    }


    fun saveLicenseId(psshKey: ByteArray, licenseId: ByteArray, licenseDurationRemainingSec: Long) {}

    fun getLicenseId(psshKey: ByteArray?): ByteArray? = null

    fun getLicenseDurationRemainingSec(psshKey: ByteArray?): Long = 0
}