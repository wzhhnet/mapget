/*!

# Core Packaging

This package defines packaging information.

!*/

package core.packaging;

import core.types.*;

/*!

## Signatures and Packages

The `PackagingDetails` struct allows to provide detailed information for a
package. The packaging details include a signature ID as well as detailed
compression, encryption, and delta format information.

Compressed packages can be encrypted, but encryption cannot be applied without
compression.

!*/

rule_group PackagingRules
{
  /*!
  No Signature:

  If the package is not signed, `signatureId` shall be set to `NO_SIGNATURE`.
  !*/

  rule "core-8sheds";

  /*!
  No Compression:

  If no compression has been applied to the package, `compressionType` shall be set to `NO_COMPRESSION`.
  !*/

  rule "core-45qopw";

  /*!
  No Encryption:

  If the package is not encrypted, `encryptionType` shall be set to `NO_ENCRYPTION`.
  !*/

  rule "core-jst8mb";
};

/**
  * Detailed information about a package. Packaging details include a signature ID
  * as well as detailed compression, encryption, and delta format information.
  */
struct PackagingDetails
{
  /** Signature ID of the applied signature algorithm. */
  SignatureId signatureId;

  /** Compression algorithm used to compress the package. */
  CompressionType compressionType;

  /**
    * Type of encryption applied to the package.
    * Encryption is only allowed if the data is also compressed.
    */
  EncryptionType encryptionType
                : (encryptionType != NO_ENCRYPTION && compressionType != NO_COMPRESSION)
                || (encryptionType == NO_ENCRYPTION);

  /** Encryption key identifier. Key management is out of scope. */
  EncryptionKeyId encryptionKeyId if encryptionType != NO_ENCRYPTION;

  /** Delta encoding details. */
  DeltaEncodingDetails deltaEncodingDetails;
};

/*!

### Signature Information

A signature is addressed by its signature ID. Each signature has a signature
type, size, information about the used hash algorithm, and a URI pointing to the
applicable key or other information that is required to use the signature.
Because key management is out of scope for NDS.Live, the URI provides the
information where the necessary key is stored.

To store and access the signature key or other relevant information to use the
signature, the following options are allowed:

1. The key is stored directly in the data layer definition using the data URI
   scheme. The string in `keyUri` follows the syntax
   `data:application/octet-stream;base64,&lt;base64_encoded_signature_key&gt;`.
   Example:
   `data:application/octet-stream;base64,iVBORw0KGg....`
1. The key is stored externally and its URI is accessed using an HTTPS `GET`
   request. The string in `keyUri` starts with "https:".

The following figure shows the signature process with the hash algorithm
SHA3-256 and the signature calculation method ECDSA. First, the map data that is
to be signed is hashed, then the hash is signed, and finally the signature is
provided to the application along with the map data and the public key. The
application in return generates a hash for the map data and checks the signature
with the public key.

![Example of how to use signatures](assets/Core_signature-on-hash.png)

!*/

rule_group SignatureInformationRules
{
  /*!
  Encoding of Undefined Signature Types:

  To encode signature types that are not officially defined by NDS, use a value
  greater than or equal to 10000.
  !*/

  rule "core-0v57om";

  /*!
  URI Schemes of Signature Keys:

  The URI of a signature key in `keyUri` shall be stored either using the data
  URI scheme or using the HTTPS URI scheme.
  !*/

  rule "core-eriowx";
};

/** Information about a signature, for example, signature type,
  * signature size, and information about the applied hash algorithm.
  */
struct SignatureDefinition
{
  /** Identifier of the signature. */
  SignatureId id;

  /** Type of the signature. */
  SignatureType type;

  /** Signature size in bits. */
  SignatureSize size;

  /** Hash type used to hash the data before signing. */
  HashType hashType;

  /** Descriptive name of the signature. */
  string name;

  /**
    * URI to the signature's key (for example, RSA public key) or other
    * information required to use the signature. The key is either stored
    * locally using the data URI scheme or externally using the HTTPS URI
    * scheme.
    */
  string keyUri;
};


/** Identifier of a signature calculation method. */
subtype varuint16 SignatureId;

/** Value to use if data is not signed. */
const SignatureId NO_SIGNATURE = 0;

/**
 * Predefined signature calculation methods. For types not
 * defined officially by NDS, use a value greater than or equal to 10000.
 */
subtype varuint16 SignatureType;

/** Rivest–Shamir–Adleman Algorithm (RSA). */
const SignatureType RSA   = 1;

/** Elliptic Curve Digital Signature Algorithm (ECDSA). */
const SignatureType ECDSA = 2;

/**
 * Size of the signature. Fixed sizes are defined in bits.
 * 0 means variable size.
 *
 * If a signature does not have a fixed size, but varies depending on
 * the signed data, the const value `VARIABLE` is used.
 */
subtype varuint32 SignatureSize;

/** Value to use for signatures with varying size depending on the signed data. */
const SignatureSize VARIABLE = 0;

/** Type of hash algorithm used to hash the data before a signature is calculated. */
subtype varuint16 HashType;

const HashType CRC32 = 0;
const HashType SHA2_224 = 1;
const HashType SHA2_256 = 2;
const HashType SHA2_384 = 3;
const HashType SHA2_512 = 4;
const HashType SHA2_512_224 = 5;
const HashType SHA2_512_256 = 6;
const HashType SHA3_224 = 9;
const HashType SHA3_256 = 10;
const HashType SHA3_384 = 11;
const HashType SHA3_512 = 12;

/*!

### Compression

The following compression types are available to compress packages.

!*/

/** Available compression types used to compress packages. */
subtype varuint16 CompressionType;

/** Data is not compressed. */
const CompressionType NO_COMPRESSION = 0;

/** Data is compressed using zlib compression. See https://zlib.net */
const CompressionType ZLIB = 1;

/** Data is compressed using zstd compression. See https://github.com/facebook/zstd */
const CompressionType ZSTD = 2;

/** Data is compressed using LZ4 compression in LZ4's frame format. See https://github.com/lz4/lz4 */
const CompressionType LZ4 = 3;

/** Data is compressed using Brotli compression. See https://github.com/google/brotli */
const CompressionType BROTLI = 4;

/*!

### Encryption

Packages can be encrypted using the encryption methods described here.
At the moment the same encryption method as in NDS.Classic can be used.
This is to only encrypt the first part of compressed data. The encryption key
is not in scope of NDS. Simply an identifier is provided to enable the reading
application to choose from a key store.

!*/

/** ID to identify the used encryption key. */
subtype varuint32 EncryptionKeyId;

/** Type of encryption used to encrypt data. */
subtype varuint16 EncryptionType;

/** Use this value if the data is not encrypted. */
const EncryptionType NO_ENCRYPTION = 0;

/**
  * The first 4 blocks of the compressed content is encrypted using
  * AES-128 in ECB mode.
  */
const EncryptionType COMPRESSED_4_BLOCKS_AES_128_ECB = 1;

/*!

### Delta Format

Packages can be delta encoded to save space. To make this work a client
has to possess the base version of the package already and apply the delta
before using it.

!*/


/** Type of delta format used. */
subtype uint8 DeltaEncodingType;

/** Use this value if the data is not delta encoded. */
const DeltaEncodingType NO_DELTA = 0;

/** Delta is encoded using the VCDIFF algorithm (RFC3284). */
const DeltaEncodingType VCDIFF = 1;

/** Delta is encoded using the BSDIFF 4 algorithm. (http://www.daemonology.net/bsdiff/) */
const DeltaEncodingType BSDIFF4 = 2;

/**
  * Delta is encoded using the Fossil Delta algorithm used in SQLite.
  * (https://fossil-scm.org/home/doc/tip/www/delta_format.wiki)
  */
const DeltaEncodingType FOSSIL_DELTA = 3;

/** Complete layer has been deleted. The layer is empty (zero size). */
const DeltaEncodingType LAYER_DELETED = 4;

/** No update is available for the layer. The layer is empty (zero size). */
const DeltaEncodingType NO_UPDATE = 5;

/** Details on the delta encoded package. */
struct DeltaEncodingDetails
{
  /** Type of delta encoding used. */
  DeltaEncodingType deltaEncodingType;

  /** Version ID of the source/base version onto which the delta has to be applied. */
  VersionId sourceVersion if deltaEncodingType != NO_DELTA
                          && deltaEncodingType != LAYER_DELETED
                          && deltaEncodingType != NO_UPDATE;
};
