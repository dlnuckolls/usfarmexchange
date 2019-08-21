﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace USFarmExchange {
  public static class EncryptionHelper {

    const string EncryptionKey = "USFarmExchange+Portal+Encryption";
    private const int Keysize = 256;
    private const int DerivationIterations = 1000;

    public static string Encrypt(string clearText) {
      //string EncryptionKey = "MAKV2SPBNI99212";
      byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
      using(Aes encryptor = Aes.Create()) {
        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
        encryptor.Key = pdb.GetBytes(32);
        encryptor.IV = pdb.GetBytes(16);
        using(MemoryStream ms = new MemoryStream()) {
          using(CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write)) {
            cs.Write(clearBytes, 0, clearBytes.Length);
            cs.Close();
          }
          clearText = Convert.ToBase64String(ms.ToArray());
        }
      }
      return clearText;
    }

    public static string Decrypt(string cipherText) {
      //string EncryptionKey = "MAKV2SPBNI99212";
      byte[] cipherBytes = Convert.FromBase64String(cipherText);
      using(Aes encryptor = Aes.Create()) {
        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
        encryptor.Key = pdb.GetBytes(32);
        encryptor.IV = pdb.GetBytes(16);
        using(MemoryStream ms = new MemoryStream()) {
          using(CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write)) {
            cs.Write(cipherBytes, 0, cipherBytes.Length);
            cs.Close();
          }
          cipherText = Encoding.Unicode.GetString(ms.ToArray());
        }
      }
      return cipherText;
    }
    //public static string Encrypt(string plainText) {
    //  // Salt and IV is randomly generated each time, but is preprended to encrypted cipher text
    //  // so that the same Salt and IV values can be used when decrypting.  
    //  var saltStringBytes = Generate256BitsOfRandomEntropy();
    //  var ivStringBytes = Generate256BitsOfRandomEntropy();
    //  var plainTextBytes = Encoding.UTF8.GetBytes(plainText);
    //  using(var password = new Rfc2898DeriveBytes(EncryptionKey, saltStringBytes, DerivationIterations)) {
    //    var keyBytes = password.GetBytes(Keysize / 8);
    //    using(var symmetricKey = new RijndaelManaged()) {
    //      symmetricKey.BlockSize = 256;
    //      symmetricKey.Mode = CipherMode.CBC;
    //      symmetricKey.Padding = PaddingMode.PKCS7;
    //      using(var encryptor = symmetricKey.CreateEncryptor(keyBytes, ivStringBytes)) {
    //        using(var memoryStream = new MemoryStream()) {
    //          using(var cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write)) {
    //            cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);
    //            cryptoStream.FlushFinalBlock();
    //            // Create the final bytes as a concatenation of the random salt bytes, the random iv bytes and the cipher bytes.
    //            var cipherTextBytes = saltStringBytes;
    //            cipherTextBytes = cipherTextBytes.Concat(ivStringBytes).ToArray();
    //            cipherTextBytes = cipherTextBytes.Concat(memoryStream.ToArray()).ToArray();
    //            memoryStream.Close();
    //            cryptoStream.Close();
    //            return Convert.ToBase64String(cipherTextBytes);
    //          }
    //        }
    //      }
    //    }
    //  }
    //}

    //public static string Decrypt(string cipherText) {
    //  // Get the complete stream of bytes that represent:
    //  // [32 bytes of Salt] + [32 bytes of IV] + [n bytes of CipherText]
    //  var cipherTextBytesWithSaltAndIv = Convert.FromBase64String(cipherText);
    //  // Get the saltbytes by extracting the first 32 bytes from the supplied cipherText bytes.
    //  var saltStringBytes = cipherTextBytesWithSaltAndIv.Take(Keysize / 8).ToArray();
    //  // Get the IV bytes by extracting the next 32 bytes from the supplied cipherText bytes.
    //  var ivStringBytes = cipherTextBytesWithSaltAndIv.Skip(Keysize / 8).Take(Keysize / 8).ToArray();
    //  // Get the actual cipher text bytes by removing the first 64 bytes from the cipherText string.
    //  var cipherTextBytes = cipherTextBytesWithSaltAndIv.Skip((Keysize / 8) * 2).Take(cipherTextBytesWithSaltAndIv.Length - ((Keysize / 8) * 2)).ToArray();

    //  using(var password = new Rfc2898DeriveBytes(EncryptionKey, saltStringBytes, DerivationIterations)) {
    //    var keyBytes = password.GetBytes(Keysize / 8);
    //    using(var symmetricKey = new RijndaelManaged()) {
    //      symmetricKey.BlockSize = 256;
    //      symmetricKey.Mode = CipherMode.CBC;
    //      symmetricKey.Padding = PaddingMode.PKCS7;
    //      using(var decryptor = symmetricKey.CreateDecryptor(keyBytes, ivStringBytes)) {
    //        using(var memoryStream = new MemoryStream(cipherTextBytes)) {
    //          using(var cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read)) {
    //            var plainTextBytes = new byte[cipherTextBytes.Length];
    //            var decryptedByteCount = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length);
    //            memoryStream.Close();
    //            cryptoStream.Close();
    //            return Encoding.UTF8.GetString(plainTextBytes, 0, decryptedByteCount);
    //          }
    //        }
    //      }
    //    }
    //  }
    //}

    //private static byte[] Generate256BitsOfRandomEntropy() {
    //  var randomBytes = new byte[32]; // 32 Bytes will give us 256 bits.
    //  using(var rngCsp = new RNGCryptoServiceProvider()) {
    //    // Fill the array with cryptographically secure random bytes.
    //    rngCsp.GetBytes(randomBytes);
    //  }
    //  return randomBytes;
    //}
  }
}