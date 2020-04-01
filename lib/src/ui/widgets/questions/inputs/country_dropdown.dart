import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/l10n/country_localizations.dart';

typedef CountryDropdownSearchFunction = List<int> Function(
    String keyword, List<DropdownMenuItem<String>> items);

class CountryDropdown extends StatefulWidget {
  const CountryDropdown({
    Key key,
    this.searchHint,
    this.onChanged,
    this.searchFunction,
    this.value,
    this.iconSize,
  }) : super(key: key);

  final Widget searchHint;
  final ValueChanged<String> onChanged;
  final CountryDropdownSearchFunction searchFunction;
  final String value;
  final double iconSize;

  @override
  _CountryDropdownState createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  Map<String, String> countryCodeToName;
  Map<String, String> nameToCountryCode;
  List<DropdownMenuItem<String>> _dropdownItems;

  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateCountryCodes(context);
    _dropdownItems = _getDropdownItems(context);
  }

  List<int> _findItemsForSearch(
      String keyword, List<DropdownMenuItem<String>> items) {
    List<int> results = <int>[];
    for (int i = 0; i < items.length; ++i) {
      if (items[i].value == 'None') {
        continue;
      }
      final name = countryCodeToName[items[i].value];
      if (keyword == null || keyword.isEmpty) {
        results.add(i);
      } else {
        if (name.toLowerCase().contains(keyword.toLowerCase())) {
          results.add(i);
        }
      }
    }
    return results;
  }

  void _updateCountryCodes(BuildContext context) {
    final CountryLocalizations localizations = CountryLocalizations.of(context);
    countryCodeToName = localizations.countryNames;
    nameToCountryCode = <String, String>{};
    for (final String code in countryCodeToName.keys) {
      nameToCountryCode[countryCodeToName[code]] = code;
    }
  }

  List<DropdownMenuItem<String>> _getDropdownItems(BuildContext context) {
    final CountryLocalizations countryLocalizations =
        CountryLocalizations.of(context);
    final AppLocalizations appLocalizations = AppLocalizations.of(context);

    final List<String> countries =
        countryLocalizations.countryNames.values.toList();
    final String unitedStates = countryLocalizations.countryNames['US'];
    countries.sort();
    // Move the United States first in the list.
    countries.remove(unitedStates);
    countries.insert(0, unitedStates);
    final List<DropdownMenuItem<String>> result = countries
        .map<DropdownMenuItem<String>>(
          (String country) => DropdownMenuItem<String>(
            child: Text(
              country,
              style: Theme.of(context).textTheme.subhead,
              overflow: TextOverflow.ellipsis,
            ),
            value: nameToCountryCode[country],
          ),
        )
        .toList();

    // Add the "No selection" selection.
    result.insert(
      0,
      DropdownMenuItem<String>(
        child: Text(appLocalizations.locationStepNoCountrySelected,
            style: Theme.of(context).textTheme.button.copyWith(
                  fontStyle: FontStyle.italic,
                )),
        value: 'None',
      ),
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    if (countryCodeToName == null) {
      _updateCountryCodes(context);
    }

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 100),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(localizations.locationStepCountryButtonLabel,
                  style: Theme.of(context).textTheme.title),
            ),
            Expanded(
              child: SearchableDropdown(
                searchHint: widget.searchHint ??
                    Text(localizations.locationStepCountrySearchPrompt),
                onChanged: widget.onChanged,
                searchFn: widget.searchFunction ?? _findItemsForSearch,
                items: _dropdownItems,
                style: Theme.of(context).textTheme.subhead,
                value: widget.value,
                iconSize: 40,
                isExpanded: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
