/*!

# Core Speech

This package provides definitions for speech information.

**Dependencies**
!*/

package core.speech;

import core.types.*;

/*!

## Phonetic Transcriptions

Phonetic transcriptions describe the representation of speech sounds using
symbols in phonetic alphabets, such as the International Phonetic Alphabet
(IPA). Such alphabets are necessary because most languages show a discrepancy
between their official orthography and the actual pronunciation.

Because navigation systems mainly deal with proper names which often have an
irregular pronunciation, phonetic transcription is an integral part of
navigation databases. Navigation systems use phonetic transcriptions for the
following purposes:

- Converting text to speech, for example, for route guidance messages or
  location input (Text-to-Speech (TTS))
- Matching the user’s speech input with database items, for example, for
  location input (Automatic Speech Recognition (ASR))

The phonetic transcription list contains a list of phonetic transcriptions and
their format. A phonetic transcription contains the actual transcription string.
The transcription optionally contains information on grammatical case and prefix
strings.

Phonetic transcriptions can have a different language code than the name
string they represent. Examples:

- A place name is stored with the language code for the region, but different
  pronunciations are to be provided for regional variants. For example, a city
  name is stored with the language code AUT_deu, but a phoneme for DEU_deu is
  provided.
- Road numbers are stored without a dedicated language code. To
  provide the correct guidance instructions, phonetic transcriptions are
  provided with the relevant language codes.

!*/

/** List of phonetic transcriptions for a specific transcription format. */
struct PhoneticTranscriptionList
{
  /** Phonetic transcription format in which the transcriptions are stored. */
  PhoneticTranscriptionFormat format;

  /** Phonetic transcriptions. */
  packed PhoneticTranscription transcriptions[];
};

/** Phonetic transcription format. */
enum uint8 PhoneticTranscriptionFormat
{
  /** International Phonetic Alphabet. */
  IPA,

  /**
    * StarRec SAMPA dialect.
    * Note: DO NOT USE! Kept for compatibility reasons only!
    */
  STARREC_SAMPA,

  /** Extended Speech Assessment Methods Phonetic Alphabet (X-SAMPA). */
  X_SAMPA,

  /** Cerence LH+ format. */
  LH_PLUS,

  /** SAMPA dialect of HERE. */
  NT_SAMPA,

  /**
    * SVOX.
    * Note: DO NOT USE! Kept for compatibility reasons only!
    */
  SVOX_PA,

  /** Cerence LH+ version 2.4 format. */
  LH_PLUS_V24,

  /** iFlytec. Chinese phoneme format. */
  I_FLYTEC,

  /** JEITA 6004. Japanese standard for synthesized text-to-speech. */
  JEITA,

  /** Plain text with no special format. */
  PLAIN_TEXT,
};

/** Phonetic transcription. */
struct PhoneticTranscription
{
  /** String containing the phonetic transcription. */
  string phoneticTranscriptionString;

  /** Language code of the phonetic transcription. */
  LanguageCode languageCode;

  /** Optional grammatical case for selecting the correct word forms. */
  optional packed GrammaticalCase grammaticalCase[];

  /** Optional phonetic prefix. */
  optional PhoneticPrefix prefix;

  /** Pronunciation of the phoneme. */
  optional SpeechType speechType;
};

/*!

### Grammatical Case

For some languages, speech functions require additional information about
grammatical case to select the correct word form.
For example, the Slavic languages Russian and Croatian, require specific grammatical
cases after certain prepositions. For this reason, the case of a specific phonetic
transcription is stored alongside the actual transcription string. This enables
TTS applications to select the grammatically correct form for guidance instructions.

!*/

/** Grammatical case of a specific phonetic transcription stored alongside
  * the actual transcription string.
  */
enum uint8 GrammaticalCase
{
  /** Default value if no grammatical case is specified. */
  NO_GRAMMATICAL_CASE,

  /** Abessive case. */
  ABESSIVE_CASE,

  /** Ablative case. */
  ABLATIVE_CASE,

  /** Absolutive case. */
  ABSOLUTIVE_CASE,

  /** Adessive case. */
  ADESSIVE_CASE,

  /** Accusative case. */
  ACCUSATIVE_CASE,

  /** Allative case. */
  ALLATIVE_CASE,

  /** Causal case. */
  CAUSAL_CASE,

  /** Comitative case. */
  COMITATIVE_CASE,

  /** Dative case. */
  DATIVE_CASE,

  /** Delative case. */
  DELATIVE_CASE,

  /** Delimitative case. */
  DELIMITATIVE_CASE,

  /** Directional case. */
  DIRECTIONAL_CASE,

  /** Distributive-temporal case. */
  DISTRIBUTIVE_TEMPORAL_CASE,

  /** Elative case. */
  ELATIVE_CASE,

  /** Equative case. */
  EQUATIVE_CASE,

  /** Ergative case. */
  ERGATIVE_CASE,

  /** Essive case. */
  ESSIVE_CASE,

  /** Final case. */
  FINAL_CASE,

  /** Genitive case. */
  GENITIVE_CASE,

  /** Illative case. */
  ILLATIVE_CASE,

  /** Inessive case. */
  INESSIVE_CASE,

  /** Instructive case. */
  INSTRUCTIVE_CASE,

  /** Instrumental case. */
  INSTRUMENTAL_CASE,

  /** Locative case. */
  LOCATIVE_CASE,

  /** Modal case. */
  MODAL_CASE,

  /** Multiplicative case. */
  MULTIPLICATIVE_CASE,

  /** Nominative case. */
  NOMINATIVE_CASE,

  /** Oblique case. */
  OBLIQUE_CASE,

  /** Partitive case. */
  PARTITIVE_CASE,

  /** Perlative case. */
  PERLATIVE_CASE,

  /** Possessive case. */
  POSSESSIVE_CASE,

  /** Postpositional case. */
  POSTPOSITIONAL_CASE,

  /** Prepositional case. */
  PREPOSITIONAL_CASE,

  /** Prolative case. */
  PROLATIVE_CASE,

  /** Sublative case. */
  SUBLATIVE_CASE,

  /** Superessive case. */
  SUPERESSIVE_CASE,

  /** Temporal case. */
  TEMPORAL_CASE,

  /** Terminative case.s */
  TERMINATIVE_CASE,

  /** Translative case. */
  TRANSLATIVE_CASE,

  /** Vocative case. */
  VOCATIVE_CASE,
};

/*!

### Phonetic Prefix

Phonetic prefixes are required for some languages in some cases.
Which prefix is appropriate depends on the use case. There are two use cases for prefixes:

- "Turn into" use case: Prefixes for guidance instructions like "Turn right into
   Washington Street" or "Rechts abbiegen in den Sachsenweg".
- "Follow" use case: Prepositions and articles for guidance instructions like
  "Follow the Washington Street" or "Folgen Sie dem Sachsenweg".

!*/

/** Phonetic prefix for different guidance instruction usage types. */
struct PhoneticPrefix
{
  /**
    * Usage type of the prefix. Usage types are turning into another road or
    * following a road.
    */
  PhoneticPrefixUsageType usageType;

  /** Prefix string. */
  string prefixString;
};

/** Usage type of a prefix. */
enum uint8 PhoneticPrefixUsageType
{
  /** Prefix is used for "Turn into" use case. */
  INTO,

  /** Prefix is used for "Follow" use case. */
  FOLLOW,
};

/*!

## Speech Type

The speech type indicates the pronunciation of the speech.

!*/

/** Pronunciation of the speech data. */
enum uint8 SpeechType
{
  /** No speech type is available. */
  NOT_AVAILABLE,

  /** First appropriate standard pronunciation. */
  FIRST_APPROPRIATE,

  /** Alternative standard pronunciation. */
  STANDARD,

  /** More casual, informal pronunciation. */
  FLUENT,

  /** Foreign pronunciation. */
  FOREIGN,

  /** Local or regional pronunciation. */
  LOCAL,

  /** Literal pronunciation. */
  LITERAL,
};
