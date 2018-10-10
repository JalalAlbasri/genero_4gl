IMPORT JAVA java.io.File
IMPORT JAVA org.apache.pdfbox.pdmodel.PDDocument
IMPORT JAVA org.apache.pdfbox.pdmodel.encryption.AccessPermission
IMPORT JAVA org.apache.pdfbox.pdmodel.encryption.StandardProtectionPolicy


MAIN
  DEFINE f File
  DEFINE pd PDDocument
  DEFINE ap AccessPermission
  DEFINE spp StandardProtectionPolicy
  DEFINE key_length INT

  LET key_length = 256

  # Instantiate Java Classes
  LET f = File.create("C:/Users/jalal/GitHub/bdl_java_pdf/test.pdf")
  LET pd = PDDocument.load(f)
  LET ap = AccessPermission.create()
  LET spp = StandardProtectionPolicy.create("12345", "qwer", ap)

  #configure AccessPermission
  CALL ap.setCanPrint(false)

  #configure StandardProtectionPolicy
  CALL spp.setEncryptionKeyLength(key_length);
  CALL spp.setPermissions(ap);
  CALL pd.protect(spp);

  # save the encrypted pdf
  CALL pd.save("C:/Users/jalal/GitHub/bdl_java_pdf/test-encrypted.pdf")
  CALL pd.close()

END MAIN
