#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "El Sonu Gravity-Speed", 
	author = "ByDexter", 
	description = "Tur bittiğinde yaşıyan oyunculara gravity ve speed verilir.", 
	version = "1.3", 
	url = "https://steamcommunity.com/id/ByDexterTR/"
};

public void OnPluginStart()
{
	HookEvent("round_start", OnRoundStart, EventHookMode_PostNoCopy);
	HookEvent("round_end", OnRoundEnd, EventHookMode_PostNoCopy);
}

public Action OnRoundStart(Event event, const char[] name, bool dB)
{
	SetConVarInt(FindConVar("sv_gravity"), 800);
	return Plugin_Continue;
}

public Action OnRoundEnd(Event event, const char[] name, bool dB)
{
	SetConVarInt(FindConVar("sv_gravity"), 100);
	for (int i = 1; i <= MaxClients; i++)if (IsClientInGame(i) && IsPlayerAlive(i) && !IsFakeClient(i))
	{
		SetEntPropFloat(i, Prop_Data, "m_flLaggedMovementValue", 2.4);
	}
	return Plugin_Continue;
} 