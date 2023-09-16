package com.loan.credito.cash.credit.efectivo.profin.prestamo.dinero.rapicredito

import android.content.Intent
import android.database.Cursor
import android.net.Uri
import android.os.Environment
import android.provider.MediaStore
import android.util.Log
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.IOException
import java.io.InputStream
import java.io.OutputStream
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.UUID


class MainActivity : FlutterActivity() {
    private var currentPhotoPath: String? = null
    private var result: MethodChannel.Result? = null

    companion object {
        const val TAKE_CODE_REQUEST_CODE = 1000
        const val PICK_CODE_REQUEST_CODE = 1001
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.plugins.add(
            OriginInfoPlugin(
                this
            )
        )
    }

    fun takePhone(result: MethodChannel.Result, takeWay: Int) {
        this.result = result
        val takePictureIntent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
        val photoFile: File? = try {
            createImageFile()
        } catch (ex: IOException) {
            ex.printStackTrace()
            backResult("")
            return
        }
        if (photoFile != null) {
            val photoUri = FileProvider.getUriForFile(
                this,
                "com.loan.credito.cash.credit.efectivo.profin",
                photoFile
            )
            takePictureIntent.putExtra(MediaStore.EXTRA_OUTPUT, photoUri)
            startActivityForResult(takePictureIntent, TAKE_CODE_REQUEST_CODE)
        }
    }

    fun selectImage(result: MethodChannel.Result) {   this.result = result
        val intent = Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI)
        intent.type = "image/*"
        startActivityForResult(Intent.createChooser(intent, "Select Picture"), PICK_CODE_REQUEST_CODE)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == TAKE_CODE_REQUEST_CODE && resultCode == RESULT_OK) {
            if (currentPhotoPath != null) {
                val tempFile = File(currentPhotoPath)
                savePermanentFile(tempFile)
                backResult(currentPhotoPath)
            }
        }


        if (requestCode == PICK_CODE_REQUEST_CODE && resultCode == RESULT_OK && null != data) {
            val selectedImage: Uri? = data.data
            val filePathColumn = arrayOf(MediaStore.Images.Media.DATA)
            Log.e("duanxin","----111111")
            selectedImage?.let {
                Log.e("duanxin",selectedImage.toString()+"----2222")
                val cursor: Cursor? = contentResolver.query(
                    it,
                    filePathColumn, null, null, null
                )
                if (cursor != null) {
                    cursor.moveToFirst()
                    val columnIndex = cursor.getColumnIndex(filePathColumn[0])
                    val picturePath = cursor.getString(columnIndex)
                    cursor.close()
                    Log.e("duanxin",picturePath .toString()+"----333")
                    backResult(picturePath)
                }
            }

        }

    }

    private fun backResult(path: String?) {
        result?.success(path)
    }

    private fun savePermanentFile(tempFile: File): String? {
        val storageDir = getExternalFilesDir(Environment.DIRECTORY_PICTURES)
        if (!storageDir!!.exists()) {
            storageDir.mkdirs()
        }
        val timeStamp = SimpleDateFormat("yyyyMMdd_HHmmss", Locale.getDefault()).format(Date())
        val permanentFileName = "IMG_$timeStamp.jpg"
        val permanentFile = File(storageDir, permanentFileName)
        val permanentFilePath = permanentFile.absolutePath
        currentPhotoPath = permanentFilePath
        try {
            val `in`: InputStream = FileInputStream(tempFile)
            val out: OutputStream = FileOutputStream(permanentFile)
            val buffer = ByteArray(1024)
            var length: Int
            while (`in`.read(buffer).also { length = it } > 0) {
                out.write(buffer, 0, length)
            }
            `in`.close()
            out.close()
        } catch (e: IOException) {
            e.printStackTrace()
            return null
        }
        return permanentFilePath
    }

    @Throws(IOException::class)
    private fun createImageFile(): File? {
        val storageDir: File? = getExternalFilesDir(Environment.DIRECTORY_PICTURES)
        val imageFileName = "IMG_" + UUID.randomUUID().toString() + ".jpg"
        val imageFile = File.createTempFile(imageFileName, ".jpg", storageDir)
        imageFile.setReadable(true, false)
        currentPhotoPath = imageFile.absolutePath
        return imageFile
    }


}
