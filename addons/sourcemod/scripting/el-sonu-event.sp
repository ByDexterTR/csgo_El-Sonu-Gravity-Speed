#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "El Sonu Gravity-Speed", 
	author = "ByDexter", 
	description = "Tur bittiğinde yaşıyan oyunculara gravity ve speed verilir.", 
	version = "1.2", 
	url = "https://steamcommunity.com/id/ByDexterTR/"
};

public void OnPluginStart()
{
	HookEvent("round_start", Control_RStart, EventHookMode_PostNoCopy);
	HookEvent("round_end", Control_REnd, EventHookMode_PostNoCopy);
}

public Action Control_RStart(Event event, const char[] name, bool dontBroadcast)
{
	SetConVarInt(FindConVar("sv_gravity"), 800, true, false);
	for (int i = 1; i <= MaxClients; i++)
	if (IsPlayerAlive(i) && !IsFakeClient(i))
		SetEntPropFloat(i, Prop_Data, "m_flLaggedMovementValue", 1.0);
}

public Action Control_REnd(Event event, const char[] name, bool dontBroadcast)
{
	SetConVarInt(FindConVar("sv_gravity"), 100, true, false);
	for (int i = 1; i <= MaxClients; i++)
	if (IsPlayerAlive(i) && !IsFakeClient(i))
		SetEntPropFloat(i, Prop_Data, "m_flLaggedMovementValue", 2.4);
} 