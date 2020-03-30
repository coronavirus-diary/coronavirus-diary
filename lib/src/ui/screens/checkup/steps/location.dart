import 'package:covidnearme/src/app.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/index.dart';
import 'package:covidnearme/src/ui/widgets/questions/step_finished_button.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/checkup/checkup.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/utils/checkups.dart';
import 'index.dart';

class LocationStep extends StatefulWidget implements CheckupStep {
  bool get isLastStep => true;

  @override
  _LocationStepState createState() => _LocationStepState();
}

class _LocationStepState extends State<LocationStep> {
  bool _countryIsValid = false;
  bool _zipIsValid = false;
  bool _isUSA = true;
  // Keep the values entered, so that when switching between modes,
  // they stick, but we don't have to update the preferences values.
  String _displayedZip;
  String _displayedCountry = 'None';

  LocalKey zipCodeKey = ValueKey<String>('ZIP Code');
  LocalKey countryKey = ValueKey<String>('Country');

  Map<String, String> countryCodeToName;
  Map<String, String> nameToCountryCode;
  List<DropdownMenuItem<String>> _dropdownItems;

  void didChangeDependencies() {
    super.didChangeDependencies();
    AppLocalizations localizations = AppLocalizations.of(context);
    _updateCountryCodes(localizations);
    _dropdownItems = _getDropdownItems(context, localizations);
  }

  void _updateCountryCodes(AppLocalizations localizations) {
    countryCodeToName = <String, String>{
      'AD': localizations.countryCodeAD,
      'AE': localizations.countryCodeAE,
      'AF': localizations.countryCodeAF,
      'AG': localizations.countryCodeAG,
      'AI': localizations.countryCodeAI,
      'AL': localizations.countryCodeAL,
      'AM': localizations.countryCodeAM,
      'AO': localizations.countryCodeAO,
      'AQ': localizations.countryCodeAQ,
      'AR': localizations.countryCodeAR,
      'AS': localizations.countryCodeAS,
      'AT': localizations.countryCodeAT,
      'AU': localizations.countryCodeAU,
      'AW': localizations.countryCodeAW,
      'AX': localizations.countryCodeAX,
      'AZ': localizations.countryCodeAZ,
      'BA': localizations.countryCodeBA,
      'BB': localizations.countryCodeBB,
      'BD': localizations.countryCodeBD,
      'BE': localizations.countryCodeBE,
      'BF': localizations.countryCodeBF,
      'BG': localizations.countryCodeBG,
      'BH': localizations.countryCodeBH,
      'BI': localizations.countryCodeBI,
      'BJ': localizations.countryCodeBJ,
      'BL': localizations.countryCodeBL,
      'BM': localizations.countryCodeBM,
      'BN': localizations.countryCodeBN,
      'BO': localizations.countryCodeBO,
      'BQ': localizations.countryCodeBQ,
      'BR': localizations.countryCodeBR,
      'BS': localizations.countryCodeBS,
      'BT': localizations.countryCodeBT,
      'BV': localizations.countryCodeBV,
      'BW': localizations.countryCodeBW,
      'BY': localizations.countryCodeBY,
      'BZ': localizations.countryCodeBZ,
      'CA': localizations.countryCodeCA,
      'CC': localizations.countryCodeCC,
      'CD': localizations.countryCodeCD,
      'CF': localizations.countryCodeCF,
      'CG': localizations.countryCodeCG,
      'CH': localizations.countryCodeCH,
      'CI': localizations.countryCodeCI,
      'CK': localizations.countryCodeCK,
      'CL': localizations.countryCodeCL,
      'CM': localizations.countryCodeCM,
      'CN': localizations.countryCodeCN,
      'CO': localizations.countryCodeCO,
      'CR': localizations.countryCodeCR,
      'CU': localizations.countryCodeCU,
      'CV': localizations.countryCodeCV,
      'CW': localizations.countryCodeCW,
      'CX': localizations.countryCodeCX,
      'CY': localizations.countryCodeCY,
      'CZ': localizations.countryCodeCZ,
      'DE': localizations.countryCodeDE,
      'DJ': localizations.countryCodeDJ,
      'DK': localizations.countryCodeDK,
      'DM': localizations.countryCodeDM,
      'DO': localizations.countryCodeDO,
      'DZ': localizations.countryCodeDZ,
      'EC': localizations.countryCodeEC,
      'EE': localizations.countryCodeEE,
      'EG': localizations.countryCodeEG,
      'EH': localizations.countryCodeEH,
      'ER': localizations.countryCodeER,
      'ES': localizations.countryCodeES,
      'ET': localizations.countryCodeET,
      'FI': localizations.countryCodeFI,
      'FJ': localizations.countryCodeFJ,
      'FK': localizations.countryCodeFK,
      'FM': localizations.countryCodeFM,
      'FO': localizations.countryCodeFO,
      'FR': localizations.countryCodeFR,
      'GA': localizations.countryCodeGA,
      'GB': localizations.countryCodeGB,
      'GD': localizations.countryCodeGD,
      'GE': localizations.countryCodeGE,
      'GF': localizations.countryCodeGF,
      'GG': localizations.countryCodeGG,
      'GH': localizations.countryCodeGH,
      'GI': localizations.countryCodeGI,
      'GL': localizations.countryCodeGL,
      'GM': localizations.countryCodeGM,
      'GN': localizations.countryCodeGN,
      'GP': localizations.countryCodeGP,
      'GQ': localizations.countryCodeGQ,
      'GR': localizations.countryCodeGR,
      'GS': localizations.countryCodeGS,
      'GT': localizations.countryCodeGT,
      'GU': localizations.countryCodeGU,
      'GW': localizations.countryCodeGW,
      'GY': localizations.countryCodeGY,
      'HK': localizations.countryCodeHK,
      'HM': localizations.countryCodeHM,
      'HN': localizations.countryCodeHN,
      'HR': localizations.countryCodeHR,
      'HT': localizations.countryCodeHT,
      'HU': localizations.countryCodeHU,
      'ID': localizations.countryCodeID,
      'IE': localizations.countryCodeIE,
      'IL': localizations.countryCodeIL,
      'IM': localizations.countryCodeIM,
      'IN': localizations.countryCodeIN,
      'IO': localizations.countryCodeIO,
      'IQ': localizations.countryCodeIQ,
      'IR': localizations.countryCodeIR,
      'IS': localizations.countryCodeIS,
      'IT': localizations.countryCodeIT,
      'JE': localizations.countryCodeJE,
      'JM': localizations.countryCodeJM,
      'JO': localizations.countryCodeJO,
      'JP': localizations.countryCodeJP,
      'KE': localizations.countryCodeKE,
      'KG': localizations.countryCodeKG,
      'KH': localizations.countryCodeKH,
      'KI': localizations.countryCodeKI,
      'KM': localizations.countryCodeKM,
      'KN': localizations.countryCodeKN,
      'KP': localizations.countryCodeKP,
      'KR': localizations.countryCodeKR,
      'KW': localizations.countryCodeKW,
      'KY': localizations.countryCodeKY,
      'KZ': localizations.countryCodeKZ,
      'LA': localizations.countryCodeLA,
      'LB': localizations.countryCodeLB,
      'LC': localizations.countryCodeLC,
      'LI': localizations.countryCodeLI,
      'LK': localizations.countryCodeLK,
      'LR': localizations.countryCodeLR,
      'LS': localizations.countryCodeLS,
      'LT': localizations.countryCodeLT,
      'LU': localizations.countryCodeLU,
      'LV': localizations.countryCodeLV,
      'LY': localizations.countryCodeLY,
      'MA': localizations.countryCodeMA,
      'MC': localizations.countryCodeMC,
      'MD': localizations.countryCodeMD,
      'ME': localizations.countryCodeME,
      'MF': localizations.countryCodeMF,
      'MG': localizations.countryCodeMG,
      'MH': localizations.countryCodeMH,
      'MK': localizations.countryCodeMK,
      'ML': localizations.countryCodeML,
      'MM': localizations.countryCodeMM,
      'MN': localizations.countryCodeMN,
      'MO': localizations.countryCodeMO,
      'MP': localizations.countryCodeMP,
      'MQ': localizations.countryCodeMQ,
      'MR': localizations.countryCodeMR,
      'MS': localizations.countryCodeMS,
      'MT': localizations.countryCodeMT,
      'MU': localizations.countryCodeMU,
      'MV': localizations.countryCodeMV,
      'MW': localizations.countryCodeMW,
      'MX': localizations.countryCodeMX,
      'MY': localizations.countryCodeMY,
      'MZ': localizations.countryCodeMZ,
      'NA': localizations.countryCodeNA,
      'NC': localizations.countryCodeNC,
      'NE': localizations.countryCodeNE,
      'NF': localizations.countryCodeNF,
      'NG': localizations.countryCodeNG,
      'NI': localizations.countryCodeNI,
      'NL': localizations.countryCodeNL,
      'NO': localizations.countryCodeNO,
      'NP': localizations.countryCodeNP,
      'NR': localizations.countryCodeNR,
      'NU': localizations.countryCodeNU,
      'NZ': localizations.countryCodeNZ,
      'OM': localizations.countryCodeOM,
      'PA': localizations.countryCodePA,
      'PE': localizations.countryCodePE,
      'PF': localizations.countryCodePF,
      'PG': localizations.countryCodePG,
      'PH': localizations.countryCodePH,
      'PK': localizations.countryCodePK,
      'PL': localizations.countryCodePL,
      'PM': localizations.countryCodePM,
      'PN': localizations.countryCodePN,
      'PR': localizations.countryCodePR,
      'PS': localizations.countryCodePS,
      'PT': localizations.countryCodePT,
      'PW': localizations.countryCodePW,
      'PY': localizations.countryCodePY,
      'QA': localizations.countryCodeQA,
      'RE': localizations.countryCodeRE,
      'RO': localizations.countryCodeRO,
      'RS': localizations.countryCodeRS,
      'RU': localizations.countryCodeRU,
      'RW': localizations.countryCodeRW,
      'SA': localizations.countryCodeSA,
      'SB': localizations.countryCodeSB,
      'SC': localizations.countryCodeSC,
      'SD': localizations.countryCodeSD,
      'SE': localizations.countryCodeSE,
      'SG': localizations.countryCodeSG,
      'SH': localizations.countryCodeSH,
      'SI': localizations.countryCodeSI,
      'SJ': localizations.countryCodeSJ,
      'SK': localizations.countryCodeSK,
      'SL': localizations.countryCodeSL,
      'SM': localizations.countryCodeSM,
      'SN': localizations.countryCodeSN,
      'SO': localizations.countryCodeSO,
      'SR': localizations.countryCodeSR,
      'SS': localizations.countryCodeSS,
      'ST': localizations.countryCodeST,
      'SV': localizations.countryCodeSV,
      'SX': localizations.countryCodeSX,
      'SY': localizations.countryCodeSY,
      'SZ': localizations.countryCodeSZ,
      'TC': localizations.countryCodeTC,
      'TD': localizations.countryCodeTD,
      'TF': localizations.countryCodeTF,
      'TG': localizations.countryCodeTG,
      'TH': localizations.countryCodeTH,
      'TJ': localizations.countryCodeTJ,
      'TK': localizations.countryCodeTK,
      'TL': localizations.countryCodeTL,
      'TM': localizations.countryCodeTM,
      'TN': localizations.countryCodeTN,
      'TO': localizations.countryCodeTO,
      'TR': localizations.countryCodeTR,
      'TT': localizations.countryCodeTT,
      'TV': localizations.countryCodeTV,
      'TW': localizations.countryCodeTW,
      'TZ': localizations.countryCodeTZ,
      'UA': localizations.countryCodeUA,
      'UG': localizations.countryCodeUG,
      'UM': localizations.countryCodeUM,
      'UY': localizations.countryCodeUY,
      'UZ': localizations.countryCodeUZ,
      'VA': localizations.countryCodeVA,
      'VC': localizations.countryCodeVC,
      'VE': localizations.countryCodeVE,
      'VG': localizations.countryCodeVG,
      'VI': localizations.countryCodeVI,
      'VN': localizations.countryCodeVN,
      'VU': localizations.countryCodeVU,
      'WF': localizations.countryCodeWF,
      'WS': localizations.countryCodeWS,
      'YE': localizations.countryCodeYE,
      'YT': localizations.countryCodeYT,
      'ZA': localizations.countryCodeZA,
      'ZM': localizations.countryCodeZM,
      'ZW': localizations.countryCodeZW,
    };
    nameToCountryCode = <String, String>{};
    for (final String code in countryCodeToName.keys) {
      nameToCountryCode[countryCodeToName[code]] = code;
    }
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      BuildContext context, AppLocalizations localizations) {
    final List<String> countries = nameToCountryCode.keys.toList();
    countries.sort();
    final List<DropdownMenuItem<String>> result = countries
        .map<DropdownMenuItem<String>>(
          (String country) => DropdownMenuItem<String>(
        child: Text(country),
        value: nameToCountryCode[country],
      ),
    )
        .toList();

    // Add the "No selection" selection.
    result.insert(
      0,
      DropdownMenuItem<String>(
        child: Text(localizations.locationStepNoCountrySelected,
            style: Theme.of(context).textTheme.button.copyWith(
              fontStyle: FontStyle.italic,
            )),
        value: 'None',
      ),
    );
    return result;
  }

  String _validateZipCode(String value, [AppLocalizations localizations]) {
    if (value != '') {
      final int zipValue = int.tryParse(value, radix: 10);
      if (value.length != 5 || zipValue == null) {
        return localizations?.locationStepInvalidZipCode ?? '';
      }
    }
    return null;
  }

  bool _updateValidity() {
    bool valid = false;
    if (_isUSA) {
      valid = _displayedZip != null && _displayedZip.isNotEmpty && _validateZipCode(_displayedZip) == null;
      if (_zipIsValid != valid) {
        setState(() {
          _zipIsValid = valid;
        });
      }
    } else {
      valid = _displayedCountry != 'None';
      if (_countryIsValid != valid) {
        setState(() {
          _countryIsValid = valid;
        });
      }
    }
    return valid;
  }

  void _updateZipCode({
    String zipCode,
    @required CheckupStateInProgress checkupState,
    @required AppLocalizations localizations,
  }) {
    assert(zipCode != null);
    setState(() {
      _displayedZip = zipCode;
    });
    // Validate before saving.
    if (!_updateValidity()) {
      return;
    }

    updateCheckup(
      checkupState: checkupState,
      context: context,
      updateFunction: (Checkup checkup) {
        final CheckupLocation newResponse = CheckupLocation(
          zipCode: zipCode,
          country: 'US',
        );

        checkup.location = newResponse;
        return checkup;
      },
    );
  }

  void _updateCountry({
    String countryCode,
    @required CheckupStateInProgress checkupState,
    @required AppLocalizations localizations,
  }) {
    assert(countryCode != null);
    setState(() {
      _displayedCountry = countryCode;
    });
    // Validate before saving.
    if (!_updateValidity()) {
      return;
    }

    updateCheckup(
      checkupState: checkupState,
      context: context,
      updateFunction: (Checkup checkup) {
        final CheckupLocation newResponse = CheckupLocation(
          zipCode: null,
          country: countryCode,
        );

        checkup.location = newResponse;
        return checkup;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    if (countryCodeToName == null) {
      _updateCountryCodes(localizations);
    }
    return BlocBuilder<CheckupBloc, CheckupState>(
      builder: (context, state) {
        final CheckupStateInProgress checkupState = state;
        final CheckupLocation existingResponse = checkupState.checkup.location;
        _displayedZip ??= existingResponse != null ? existingResponse.zipCode : '';
        _displayedCountry ??= existingResponse != null ? existingResponse.country : '';
        return ScrollableBody(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      localizations.locationStepTitle,
                      style: Theme.of(context).textTheme.title.copyWith(
                            fontSize: 26,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      children: <Widget>[
                        _LabeledRadio<bool>(
                          onTap: () {
                            setState(() {
                              _isUSA = true;
                              _updateValidity();
                            });
                          },
                          value: true,
                          groupValue: _isUSA,
                          label: localizations.locationStepInUSA,
                        ),
                        _LabeledRadio<bool>(
                          onTap: () {
                            setState(() {
                              _isUSA = false;
                              _updateValidity();
                            });
                          },
                          value: false,
                          groupValue: _isUSA,
                          label: localizations.locationStepAnotherCountry,
                        ),
                      ],
                    ),
                  ),
                  if (_isUSA)
                    EntryField(
                      key: zipCodeKey,
                      initialValue: _displayedZip,
                      onChanged: (String value) => _updateZipCode(
                        zipCode: value,
                        checkupState: checkupState,
                        localizations: localizations,
                      ),
                      label: localizations.locationStepZipCode,
                      keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                      validator: (String string) => _validateZipCode(string, localizations),
                    ),
                  if (!_isUSA)
                    DropdownButton(
                      key: countryKey,
                      onChanged: (String value) => _updateCountry(
                        countryCode: value,
                        checkupState: checkupState,
                        localizations: localizations,
                      ),
                      items: _dropdownItems,
                      style: Theme.of(context).textTheme.button,
                      value: _displayedCountry,
                    ),
                  StepFinishedButton(
                    isLastStep: false,
                    validated: (_isUSA && _zipIsValid) || (!_isUSA && _countryIsValid),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LabeledRadio<T> extends StatelessWidget {
  const _LabeledRadio({
    this.onTap,
    this.value,
    this.groupValue,
    this.label,
  });

  final VoidCallback onTap;
  final T value;
  final T groupValue;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Radio<T>(
          onChanged: (T value) => onTap(),
          value: value,
          groupValue: groupValue,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(label, style: Theme.of(context).textTheme.button),
        ),
      ],
    );
  }
}
