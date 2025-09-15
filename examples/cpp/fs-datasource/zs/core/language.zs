/*!

# Language Metadata

This package defines all language-related structures in NDS.Live.

**Dependencies**

!*/

package core.language;

import core.types.*;

/*!

## Language Availability

`AvailableLanguages` provides the available languages in the NDS map.

!*/

/** List of supported languages. */
struct AvailableLanguages
{
  /** All available languages that are supported in the NDS map. **/
  LanguageMapping availableLanguages[];
};

/*!

## Languages

`LanguageMapping` provides information about supported languages,
including translations of language names.

For territories that do not have an official ISO 3166-1 alpha 3 country code,
`isoCountryCode` is set to a user-defined country code.

`isTransliterationOf` defines that the language is a transliteration of the language
identified by `isoCountryCode`. If the language is no transliteration, the
language code `UNDEFINED_LANGUAGE_CODE` is used. If the language code is
`UNDEFINED_LANGUAGE_CODE`, the attribute `isTransliterationOf` is set to 0.

Example: If language code 3 represents Greek and language code 4 represents Greek
transliterated into Latin, `isTransliterationOf` of language code 4 is set to 3.

Relations between languages are needed for the following requirements:
- Filtering of transliterations originating from different OEM wishes, for example,
    in location input, map display, route lists.
- Support of new transliteration language codes without updating the navigation software.
- Support of interoperability for transliterations without standardizing language codes.

__Note:__
To enable the distinction between transliterations, each transliteration has a
different language code.
Example: For Greek names, a Latin and a Cyrillic transliteration exist. Each
transliteration uses a unique language code.

!*/

rule_group LanguageMappingRules
{
  /*!
  Territories without ISO Country Code:

  For territories that do not have an official ISO 3166-1 alpha 3 country
  code, `isoCountryCode` shall be set to a user-defined country code.
  !*/

  rule "core-00gsta";

  /*!
  Non-Transliteration Languages:

  If the language is no transliteration, `isoLanguageCode` shall be set to
  `UNDEFINED_LANGUAGE_CODE`.
  !*/

  rule "core-02gn7q";

  /*!
  Undefined Language Code:

  If the language code is `UNDEFINED_LANGUAGE_CODE`, the attribute
  `isTransliterationOf` shall be set to 0.
  !*/

  rule "core-02r8uu";

  /*!
  Unique Language Code for Transliterations:

  Each transliteration shall have a unique language code.
  !*/

  rule "core-04kb04";

  /*!
  `isoCountryCode` Conformity:

  Each `isoCountryCode` shall conform to ISO-3166-1 alpha 3 code.
  !*/

  rule "core-04oh7o";

  /*!
  `isoLanguageCode` Conformity:

  Each `isoLanguageCode` shall conform to ISO 639-3.
  !*/

  rule "core-08ybvy";

  /*!
  `isoScriptCode` Conformity:

  Each `isoScriptCode` shall conform to ISO 15924.
  !*/

  rule "core-09kkqp";
};

/** Mapping of languages using ISO language codes, includes transliterations. */
struct LanguageMapping
{
  /** Numeric language code.*/
  LanguageCode  languageCode;

  /**
    * ISO country code according to ISO-3166-1 alpha 3 code, with three
    * uppercase characters.
    */
  string        isoCountryCode;

  /** ISO language code according to ISO 639-3, with three lowercase characters.*/
  string        isoLanguageCode;

  /**
    * ISO script code according to ISO 15924, with first letter in uppercase and
    * the remaining letters in lowercase characters. Examples: Latn, Cyrl.
    */
  string        isoScriptCode;

  /** Indicates whether the language is a transliteration.*/
  LanguageCode  isTransliterationOf;

  /** Indicates whether the language is a diacritic transliteration.*/
  LanguageCode  isDiacriticTransliterationOf;

  /** List of languages with language code and language name. */
  LanguageName  languageNames[];
};

/** Name of a language in a specific language code. */
struct LanguageName
{
  /** The language code of the language name.*/
  LanguageCode languageCode;

  /** The name of the language in the given language code.*/
  string languageName;
};

/*!

## Collection of Character Charts

`CharacterChartCodeColl` provides a collection of UTF-8 character charts.

For detailed information on character charts of unicode refer
to http://unicode.org/charts.

The character charts in `characterChartCode` are encoded by the first UTF-8
character of the chart.

Example: Latin-1 is encoded by 0x0080.

!*/

/** Collection of UTF-8 character charts. */
struct CharacterChartCodeColl
{
  /** Code of an available UTF-8 character chart.*/
  uint32 characterChartCode[];
};
