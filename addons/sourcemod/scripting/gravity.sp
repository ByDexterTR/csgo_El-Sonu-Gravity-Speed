// ---- include ---- //

#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <sdkhooks>
#include <multicolors>

// ---- pragma ---- //

#pragma semicolon 1
#pragma newdecls required

// ---- myinfo ---- //

public Plugin myinfo = 
{
	name = "El Sonu Gravity-Speed",
	author = "ByDexter",
	description = "Tur bittiğinde yaşıyan oyunculara gravity ve speed verilir.",
	version = "1.1",
	url = "https://steamcommunity.com/id/ByDexterTR/"
};

// -------------------- OnXStart -------------------- //

public void OnPluginStart()
{
	// ---------------- Hook ---------------- //
    HookEvent("round_start", Control_RStart);
    HookEvent("round_end", Control_REnd);
}

// -------------------- Control -------------------- //

public Action Control_RStart(Event event, const char[] name, bool dontBroadcast)
{
	Handle Gravity = FindConVar("sv_gravity");
	for (int i = 1; i <= MaxClients; i++)
    if(IsPlayerAlive(i) && !IsFakeClient(i))
    {
    	SetConVarInt(Gravity, 800, true, false);
    	SetEntPropFloat(i, Prop_Data, "m_flLaggedMovementValue", 1.0);
   	}
}

public Action Control_REnd(Event event, const char[] name, bool dontBroadcast)
{
	Handle Gravity = FindConVar("sv_gravity");
	for (int i = 1; i <= MaxClients; i++)
    if(IsPlayerAlive(i) && !IsFakeClient(i))
    {
    	SetConVarInt(Gravity, 100, true, false);
    	SetEntPropFloat(i, Prop_Data, "m_flLaggedMovementValue", 2.4);
   	}
}