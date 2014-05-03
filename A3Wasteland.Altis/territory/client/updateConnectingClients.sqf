/*********************************************************#
# @@ScriptName: updateConnectingClients.sqf
# @@Author: Nick 'Bewilderbeest' Ludlam <bewilder@recoil.org>
# @@Create Date: 2013-09-15 16:26:38
# @@Modify Date: 2013-09-15 17:22:37
# @@Function: Updates JIP players with the correct territory colours
#*********************************************************/

// Exit early if we're not enabled
if (count (call config_territory_markers) == 0) exitWith { diag_log "[INFO] Territory system not enabled, not synchronising territory colors"; };

_markerColorForSide = {
    private['_side', '_markerColor'];
    _side = _this select 0;
    //diag_log format["_markerColorForSide called with %1", _this];

    _markerColor = "";
    switch (_side) do {
        case "WEST": { _markerColor = "colorblue"; };
        case "EAST": { _markerColor = "colorred"; };
        case "GUER": { _markerColor = "colorgreen"; };
        default { _markerColor = "coloryellow"; };
    };

    //diag_log format["_markerColorForSide returning %1", _markerColor];

    _markerColor
};

// MAIN

{
	private ['_markerName', '_markerOwnerSide', '_color'];
    _markerName = _x select 0;
    _markerOwnerSide = _x select 3;
    if (_markerOwnerSide != "") then {
	    _color = [_markerOwnerSide] call _markerColorForSide;
   	 	_markerName setMarkerColor _color;
    	diag_log format ["Client setting territory marker %1 to %2", _markerName, _color];
    };
} forEach currentTerritoryDetails;
