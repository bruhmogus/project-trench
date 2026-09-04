# [AUTO_EN]
cmd-invalid-arg-number-error = Invalid number of arguments.
# [AUTO_EN]
cmd-parse-failure-integer = { $arg } is not a valid integer.
# [AUTO_EN]
cmd-parse-failure-float = { $arg } is not a valid float.
# [AUTO_EN]
cmd-parse-failure-bool = { $arg } is not a valid bool.
# [AUTO_EN]
cmd-parse-failure-uid = { $arg } is not a valid entity UID.
# [AUTO_EN]
cmd-parse-failure-mapid = { $arg } is not a valid MapId.
# [AUTO_EN]
cmd-parse-failure-entity-exist = UID { $arg } does not match an existing entity.
# [AUTO_EN]
cmd-error-file-not-found = File not found: { $file }.
# [AUTO_EN]
cmd-error-dir-not-found = Failed to find directory: { $dir }.
# [AUTO_EN]
cmd-failure-no-attached-entity = No entity is attached to this shell.
# [AUTO_EN]
cmd-help-desc = Displays general help or help for a specific command
# [AUTO_EN]
cmd-help-help =
    Usage: help [command name]
    If no command name is specified, general help will be displayed. If a command name is specified, help for that command will be displayed.
# [AUTO_EN]
cmd-help-no-args = To get help for a specific command, use 'help <command>'. To get a list of all available commands, use 'list'. To search for commands, use 'list <filter>'.
# [AUTO_EN]
cmd-help-unknown = Unknown command: { $command }
cmd-help-top = { $command } - { $description }
# [AUTO_EN]
cmd-help-invalid-args = Invalid number of arguments.
# [AUTO_EN]
cmd-help-arg-cmdname = [command name]
# [AUTO_EN]
cmd-cvar-desc = Gets or sets a CVar.
# [AUTO_EN]
cmd-cvar-help =
    Usage: cvar <name | ?> [value]
    If a value is provided, it is parsed and saved as a new CVar value.
    If none is provided, the current CVar value is displayed.
    Use 'cvar ?' to get a list of all registered CVars.
# [AUTO_EN]
cmd-cvar-invalid-args = Exactly one or two arguments must be provided.
# [AUTO_EN]
cmd-cvar-not-registered = CVar '{ $cvar }' is not registered. Use 'cvar ?' to get a list of all registered CVars.
# [AUTO_EN]
cmd-cvar-parse-error = The input value has an incorrect format for type { $type }
# [AUTO_EN]
cmd-cvar-compl-list = List of available CVars
cmd-cvar-arg-name = <name | ?>
cmd-cvar-value-hidden = <value hidden>
# [AUTO_EN]
cmd-list-desc = Displays a list of available commands with an optional search filter
# [AUTO_EN]
cmd-list-help =
    Usage: list [filter]
    Outputs a list of all available commands. If an argument is provided, it will be used to filter commands by name.
cmd-list-heading = SIDE NAME            DESC{ "\u000A" }-------------------------{ "\u000A" }
# [AUTO_EN]
cmd-list-arg-filter = [filter]
# [AUTO_EN]
cmd-remoteexec-desc = Executes a command on the server side
# [AUTO_EN]
cmd-remoteexec-help =
    Usage: > <command> [arg] [arg] [arg...]
    Executes a command on the server side. This is necessary if there is a command with the same name on the client, as simple execution will first run the command on the client.
# [AUTO_EN]
cmd-gc-desc = Starts GC (Garbage Collector, Garbage Collection)
# [AUTO_EN]
cmd-gc-help =
    Usage: gc [generation]
    Uses GC.Collect() to trigger Garbage Collection.
    If an argument is provided, it is parsed as a GC generation number and used with GC.Collect(int).
    Use the 'gfc' command to perform garbage collection with 'Large Object Heap' (LOH) compaction.
# [AUTO_EN]
cmd-gc-failed-parse = Failed to parse argument.
# [AUTO_EN]
cmd-gc-arg-generation = [generation]
# [AUTO_EN]
cmd-gcf-desc = Starts GC, full, with 'large object heap' (LOH-compacting) compaction and everything else.
# [AUTO_EN]
cmd-gcf-help =
    Usage: gcf
    Executes a full GC.Collect(2, GCCollectionMode.Forced, true, true) while compressing the 'Large Object Heap' LOH.
    This will likely cause a hang for hundreds of milliseconds, keep this in mind.
# [AUTO_EN]
cmd-gc_mode-desc = Changes/Displays the GC delay mode
# [AUTO_EN]
cmd-gc_mode-help =
    Usage: gc_mode [type]
    If no argument is provided, the current GC latency mode will be returned.
    If the argument is omitted, it will be parsed as GCLatencyMode and set as the GC latency mode.
# [AUTO_EN]
cmd-gc_mode-current = current gc delay mode: { $prevMode }
# [AUTO_EN]
cmd-gc_mode-possible = possible modes:
cmd-gc_mode-option = - { $mode }
# [AUTO_EN]
cmd-gc_mode-unknown = unknown gc delay mode: { $arg }
# [AUTO_EN]
cmd-gc_mode-attempt = gc delay mode change attempt: { $prevMode } -> { $mode }
# [AUTO_EN]
cmd-gc_mode-result = received gc delay mode: { $mode }
# [AUTO_EN]
cmd-gc_mode-arg-type = [type]
# [AUTO_EN]
cmd-mem-desc = Displays information about managed memory
# [AUTO_EN]
cmd-mem-help = Usage: mem
# [AUTO_EN]
cmd-mem-report =
    Heap size: { TOSTRING($heapSize, "N0") }
    Total allocated: { TOSTRING($totalAllocated, "N0") }
# [AUTO_EN]
cmd-physics-overlay = { $overlay } is not a recognized overlay
# [AUTO_EN]
cmd-lsasm-desc = Displays a list of loaded bundles in the context of the load
# [AUTO_EN]
cmd-lsasm-help = Usage: lsasm
# [AUTO_EN]
cmd-exec-desc = Executes a script file from the game's user-writable data
# [AUTO_EN]
cmd-exec-help =
    Usage: exec <fileName>
    Each line in the file is executed as one command, unless it starts with a #
cmd-exec-arg-filename = <fileName>
# [AUTO_EN]
cmd-dump_net_comps-desc = Displays a table of network components.
# [AUTO_EN]
cmd-dump_net_comps-help = Usage: dump_net-comps
# [AUTO_EN]
cmd-dump_net_comps-error-writeable = Registration is still available for writing, network identifiers were not generated.
# [AUTO_EN]
cmd-dump_net_comps-header = Network component registrations:
# [AUTO_EN]
cmd-dump_event_tables-desc = Outputs the event tables for the entity.
# [AUTO_EN]
cmd-dump_event_tables-help = Usage: dump_event_tables <entityUid>
# [AUTO_EN]
cmd-dump_event_tables-missing-arg-entity = Entity argument missing
# [AUTO_EN]
cmd-dump_event_tables-error-entity = Invalid entity
cmd-dump_event_tables-arg-entity = <entityUid>
# [AUTO_EN]
cmd-monitor-desc = Switching the debug monitor in the F3 menu.
# [AUTO_EN]
cmd-monitor-help =
    Usage: monitor <name>
    Possible monitors: { $monitors }
    You can also use special values "-all" and "+all" to hide or show all monitors, respectively.
cmd-monitor-arg-monitor = <monitor>
# [AUTO_EN]
cmd-monitor-invalid-name = Invalid monitor name
# [AUTO_EN]
cmd-monitor-arg-count = Monitor argument missing
# [AUTO_EN]
cmd-monitor-minus-all-hint = Hides all monitors
# [AUTO_EN]
cmd-monitor-plus-all-hint = Displays all monitors
# [AUTO_EN]
cmd-set-ambient-light-desc = Allows setting ambient lighting for the specified map in SRGB format.
# [AUTO_EN]
cmd-set-ambient-light-help = Usage: setambientlight [mapid] [r g b a]
# [AUTO_EN]
cmd-set-ambient-light-parse = Failed to parse arguments as byte color values.
# [AUTO_EN]
cmd-savemap-desc = Serializes the map to disk. The map will not be saved after initialization unless done explicitly.
# [AUTO_EN]
cmd-savemap-help = Usage: savemap <MapID> <Path> [force]
# [AUTO_EN]
cmd-savemap-not-exist = Target map does not exist.
# [AUTO_EN]
cmd-savemap-init-warning = Attempt to save map after initialization without forcing a save.
# [AUTO_EN]
cmd-savemap-attempt = Attempt to save map { $mapId } to { $path }.
# [AUTO_EN]
cmd-savemap-success = Map saved successfully.
cmd-hint-savemap-id = <MapID>
cmd-hint-savemap-path = <Path>
cmd-hint-savemap-force = [bool]
# [AUTO_EN]
cmd-loadmap-desc = Loads the map from disk into the game.
# [AUTO_EN]
cmd-loadmap-help = Usage: loadmap <MapID> <Path> [x] [y] [rotation] [consistentUids]
# [AUTO_EN]
cmd-loadmap-nullspace = Cannot load into map 0.
# [AUTO_EN]
cmd-loadmap-exists = The map { $mapId } already exists.
# [AUTO_EN]
cmd-loadmap-success = The map { $mapId } was loaded from { $path }.
# [AUTO_EN]
cmd-loadmap-error = An error occurred while loading the map from { $path }.
cmd-hint-loadmap-x-position = [x-position]
cmd-hint-loadmap-y-position = [y-position]
cmd-hint-loadmap-rotation = [rotation]
cmd-hint-loadmap-uids = [float]
cmd-hint-savebp-id = <Grid EntityID>
# [AUTO_EN]
cmd-flushcookies-desc = Reset CEF-cookie storage to disk
# [AUTO_EN]
cmd-flushcookies-help =
    This ensures that cookie files are saved correctly on the disk in case of an abrupt shutdown.
    Keep in mind that the actual operation is asynchronous.
# [AUTO_EN]
cmd-ldrsc-desc = Preliminarily caches the resource.
# [AUTO_EN]
cmd-guidump-desc = Exports the GUI tree to /guidump.txt in user data.
# [AUTO_EN]
cmd-guidump-help = Usage: guidump
# [AUTO_EN]
cmd-uitest-desc = Opens the user interface test window.
# [AUTO_EN]
cmd-uitest-help = Usage: uitest
# [AUTO_EN]
cmd-uitest2-desc = Opens the window for testing user interface control.
# [AUTO_EN]
cmd-uitest2-help = Usage: uitest2 <tab>
cmd-uitest2-arg-tab = <tab>
# [AUTO_EN]
cmd-uitest2-error-args = Expected at most one argument.
# [AUTO_EN]
cmd-uitest2-error-tab = Incorrect tab: '{ $value }'
cmd-uitest2-title = UITest2
# [AUTO_EN]
cmd-setclipboard-desc = Sets the system clipboard.
# [AUTO_EN]
cmd-setclipboard-help = Usage: setclipboard <text>
# [AUTO_EN]
cmd-getclipboard-desc = Retrieves the system clipboard.
# [AUTO_EN]
cmd-getclipboard-help = Usage: Getclipboard
# [AUTO_EN]
cmd-togglelight-desc = Toggles lighting rendering.
# [AUTO_EN]
cmd-togglelight-help = Usage: togglelight
# [AUTO_EN]
cmd-togglefov-desc = Toggles FOV for the client.
# [AUTO_EN]
cmd-togglefov-help = Usage: togglefov
# [AUTO_EN]
cmd-togglehardfov-desc = Toggles hard FOV for the client. (for debugging space-station-14#2353)
# [AUTO_EN]
cmd-togglehardfov-help = Usage: togglehardfov
# [AUTO_EN]
cmd-toggleshadows-desc = Toggles shadow rendering.
# [AUTO_EN]
cmd-toggleshadows-help = Usage: toggleshadows
# [AUTO_EN]
cmd-togglelightbuf-desc = Toggles lighting rendering. This includes shadows, but not FOV.
# [AUTO_EN]
cmd-togglelightbuf-help = Usage: togglelightbuf
# [AUTO_EN]
cmd-chunkinfo-desc = Gets information about the chunk under your cursor.
# [AUTO_EN]
cmd-chunkinfo-help = Usage: chunkinfo
# [AUTO_EN]
cmd-rldshader-desc = Reloads all shaders.
# [AUTO_EN]
cmd-rldshader-help = Usage: rldshader
# [AUTO_EN]
cmd-cldbglyr-desc = Toggles FOV and lighting debug layers.
# [AUTO_EN]
cmd-cldbglyr-help =
    Usage: cldbglyr <layer>: Toggle <layer>
    cldbglyr: Turn off all layers
# [AUTO_EN]
cmd-key-info-desc = Displays information about the key.
# [AUTO_EN]
cmd-key-info-help = Usage: keyinfo <Key>
# [AUTO_EN]
cmd-bind-desc = Binds a key combination to an input command.
# [AUTO_EN]
cmd-bind-help =
    Usage: bind { cmd-bind-arg-key } { cmd-bind-arg-mode } { cmd-bind-arg-command }
    Note that this does NOT save bindings automatically. Use the 'svbind' command to save binding configuration.
cmd-bind-arg-key = <KeyName>
cmd-bind-arg-mode = <BindMode>
cmd-bind-arg-command = <InputCommand>
# [AUTO_EN]
cmd-net-draw-interp-desc = Toggles the debug display of network interpolation.
# [AUTO_EN]
cmd-net-draw-interp-help = Usage: net_draw_interp
# [AUTO_EN]
cmd-net-watch-ent-desc = Displays all network updates for EntityId to the console.
# [AUTO_EN]
cmd-net-watch-ent-help = Usage: net_watchent <0|EntityUid>
# [AUTO_EN]
cmd-net-refresh-desc = Requests the full server status.
# [AUTO_EN]
cmd-net-refresh-help = Usage: net_refresh
# [AUTO_EN]
cmd-net-entity-report-desc = Toggles the network entity report panel.
# [AUTO_EN]
cmd-net-entity-report-help = Usage: net_entityreport
# [AUTO_EN]
cmd-fill-desc = Fills the console for debugging.
# [AUTO_EN]
cmd-fill-help = Fills the console with some nonsense for debugging.
# [AUTO_EN]
cmd-cls-desc = Clears the console.
# [AUTO_EN]
cmd-cls-help = Clears the console of all messages.
# [AUTO_EN]
cmd-sendgarbage-desc = Sends garbage to the server.
# [AUTO_EN]
cmd-sendgarbage-help = The server will respond "no u"
# [AUTO_EN]
cmd-loadgrid-desc = Loads a grid from a file into an existing map.
# [AUTO_EN]
cmd-loadgrid-help = Usage: loadgrid <MapID> <Path> [x y] [rotation] [storeUids]
# [AUTO_EN]
cmd-loc-desc = Outputs the absolute location of the player entity in the console.
# [AUTO_EN]
cmd-loc-help = Usage: loc
# [AUTO_EN]
cmd-tpgrid-desc = Teleports the grid to a new location.
# [AUTO_EN]
cmd-tpgrid-help = Usage: tpgrid <gridId> <X> <Y> [<MapId>]
# [AUTO_EN]
cmd-rmgrid-desc = Removes the grid from the map. Cannot remove the default grid.
# [AUTO_EN]
cmd-rmgrid-help = Usage: rmgrid <gridId>
# [AUTO_EN]
cmd-mapinit-desc = Initiates map initialization on the map.
# [AUTO_EN]
cmd-mapinit-help = Usage: mapinit <mapID>
# [AUTO_EN]
cmd-lsmap-desc = Lists maps.
# [AUTO_EN]
cmd-lsmap-help = Usage: lsmap
# [AUTO_EN]
cmd-lsgrid-desc = Lists grids.
# [AUTO_EN]
cmd-lsgrid-help = Usage: lsgrid
# [AUTO_EN]
cmd-addmap-desc = Adds a new empty map to the round. If mapID already exists, this command does nothing.
# [AUTO_EN]
cmd-addmap-help = Usage: addmap <mapID> [initialize]
# [AUTO_EN]
cmd-rmmap-desc = Removes the map from the world. Cannot remove nullspace.
# [AUTO_EN]
cmd-rmmap-help = Usage: rmmap <mapId>
# [AUTO_EN]
cmd-savegrid-desc = Saves the grid to disk.
# [AUTO_EN]
cmd-savegrid-help = Usage: savegrid <gridID> <Path>
# [AUTO_EN]
cmd-testbed-desc = Loads the physics test field on the specified map.
# [AUTO_EN]
cmd-testbed-help = Usage: testbed <mapid> <test>
# [AUTO_EN]
cmd-saveconfig-desc = Saves the client configuration to a configuration file.
# [AUTO_EN]
cmd-saveconfig-help = Usage: saveconfig
# [AUTO_EN]
cmd-addcomp-desc = Adds a component to an entity.
# [AUTO_EN]
cmd-addcomp-help = Usage: addcomp <uid> <componentName>
# [AUTO_EN]
cmd-addcompc-desc = Adds a component to an entity on the client.
# [AUTO_EN]
cmd-addcompc-help = Usage: addcompc <uid> <componentName>
# [AUTO_EN]
cmd-rmcomp-desc = Removes a component from an entity.
# [AUTO_EN]
cmd-rmcomp-help = Usage: rmcomp <uid> <componentName>
# [AUTO_EN]
cmd-rmcompc-desc = Removes a component from an entity on the client.
# [AUTO_EN]
cmd-rmcompc-help = Usage: rmcompc <uid> <componentName>
# [AUTO_EN]
cmd-addview-desc = Allows subscribing to entity display for debugging.
# [AUTO_EN]
cmd-addview-help = Usage: addview <entityUid>
# [AUTO_EN]
cmd-addviewc-desc = Allows subscribing to entity display on the client for debugging.
# [AUTO_EN]
cmd-addviewc-help = Usage: addview <entityUid>
# [AUTO_EN]
cmd-removeview-desc = Allows unsubscribing from entity display for debugging.
# [AUTO_EN]
cmd-removeview-help = Usage: removeview <entityUid>
# [AUTO_EN]
cmd-loglevel-desc = Changes the logging level for the specified sawmill.
# [AUTO_EN]
cmd-loglevel-help =
    Usage: loglevel <sawmill> <level>
    sawmill: Label preceding log messages. For which you set the level.
    level: Log level. Must correspond to one of the values of the LogLevel enumeration.
# [AUTO_EN]
cmd-testlog-desc = Writes a test log to sawmill.
# [AUTO_EN]
cmd-testlog-help =
    Usage: testlog <sawmill> <level> <message>
    sawmill: A label preceding the registered message.
    level: Log level. Must correspond to one of the values of the LogLevel enumeration.
    message: The message to be registered. Wrap it in double quotes if you want to use spaces.
# [AUTO_EN]
cmd-vv-desc = Opens view variables.
# [AUTO_EN]
cmd-vv-help = Usage: vv <entity ID|IoC interface name|SIoC interface name>
# [AUTO_EN]
cmd-showvelocities-desc = Displays your angular and linear velocities.
# [AUTO_EN]
cmd-showvelocities-help = Usage: showvelocities
# [AUTO_EN]
cmd-setinputcontext-desc = Sets the active input context.
# [AUTO_EN]
cmd-setinputcontext-help = Usage: setinputcontext <context>
# [AUTO_EN]
cmd-forall-desc = Executes the command for all entities with the specified component.
# [AUTO_EN]
cmd-forall-help = Usage: forall <bql query> do <command...>
# [AUTO_EN]
cmd-delete-desc = Deletes the entity with the specified ID.
# [AUTO_EN]
cmd-delete-help = Usage: delete <entity UID>
# System commands
# [AUTO_EN]
cmd-showtime-desc = Displays the server time.
# [AUTO_EN]
cmd-showtime-help = Usage: showtime
# [AUTO_EN]
cmd-restart-desc = Carefully restarts the server (not just the round).
# [AUTO_EN]
cmd-restart-help = Usage: restart
# [AUTO_EN]
cmd-shutdown-desc = Gently shuts down the server.
# [AUTO_EN]
cmd-shutdown-help = Usage: shutdown
# [AUTO_EN]
cmd-netaudit-desc = Displays information about NetMsg security.
# [AUTO_EN]
cmd-netaudit-help = Usage: netaudit
# Player commands
# [AUTO_EN]
cmd-tp-desc = Teleports the player to any location on the round.
# [AUTO_EN]
cmd-tp-help = Usage: tp <x> <y> [<mapID>]
# [AUTO_EN]
cmd-tpto-desc = Teleports the current player or specified players/entities to the location of the first player/entity.
# [AUTO_EN]
cmd-tpto-help = Usage: tpto <username|uid> [username|uid]...
# [AUTO_EN]
cmd-tpto-destination-hint = destination (uid or username)
# [AUTO_EN]
cmd-tpto-victim-hint = entity for teleportation (uid or username)
# [AUTO_EN]
cmd-tpto-parse-error = Failed to find entity or player: { $str }
# [AUTO_EN]
cmd-listplayers-desc = Lists all players currently connected.
# [AUTO_EN]
cmd-listplayers-help = Usage: listplayers
# [AUTO_EN]
cmd-kick-desc = Kicks the connected player off the server, disconnecting them.
# [AUTO_EN]
cmd-kick-help = Usage: kick <PlayerIndex> [<Reason>]
# Spin command
# [AUTO_EN]
cmd-spin-desc = Forces the entity to spin. By default, the entity is the parent of the connected player.
# [AUTO_EN]
cmd-spin-help = Usage: spin velocity [drag] [entityUid]
# Localization command
# [AUTO_EN]
cmd-rldloc-desc = Reloads localization (client and server).
# [AUTO_EN]
cmd-rldloc-help = Usage: rldloc
# Debug entity controls
# [AUTO_EN]
cmd-spawn-desc = Creates an entity of the specified type.
# [AUTO_EN]
cmd-spawn-help = Usage: spawn <prototype> OR spawn <prototype> <relative entity ID> OR spawn <prototype> <x> <y>
# [AUTO_EN]
cmd-cspawn-desc = Creates a client entity of the specified type at your feet.
# [AUTO_EN]
cmd-cspawn-help = Usage: cspawn <entity type>
# [AUTO_EN]
cmd-scale-desc = Increases or decreases the size of the entity.
# [AUTO_EN]
cmd-scale-help = Usage: scale <entityUid> <float>
# [AUTO_EN]
cmd-dumpentities-desc = Outputs a list of entities.
# [AUTO_EN]
cmd-dumpentities-help = Outputs a list of entities with their UID and prototype.
# [AUTO_EN]
cmd-getcomponentregistration-desc = Retrieves component registration information.
# [AUTO_EN]
cmd-getcomponentregistration-help = Usage: getcomponentregistration <componentName>
# [AUTO_EN]
cmd-showrays-desc = Enables debug rendering of physical rays. An integer must be specified for <raylifetime>.
# [AUTO_EN]
cmd-showrays-help = Usage: showrays <raylifetime>
# [AUTO_EN]
cmd-disconnect-desc = Disconnects from the server immediately and returns to the main menu.
# [AUTO_EN]
cmd-disconnect-help = Usage: disconnect
# [AUTO_EN]
cmd-entfo-desc = Displays detailed diagnostics for the entity.
# [AUTO_EN]
cmd-entfo-help =
    Usage: entfo <entityuid>
    The object UID may have the prefix 'c' to convert it to a client object UID.
# [AUTO_EN]
cmd-fuck-desc = Triggers an exception
# [AUTO_EN]
cmd-fuck-help = Causes an exception
# [AUTO_EN]
cmd-showpos-desc = Enables debug display of all entity positions in the game.
# [AUTO_EN]
cmd-showpos-help = Usage: showpos
# [AUTO_EN]
cmd-sggcell-desc = Displays entities on the grid cell.
# [AUTO_EN]
cmd-sggcell-help = Usage: sggcell <gridID> <vector2i>\nThis parameter vector2i has the format x<int>,y<int>.
# [AUTO_EN]
cmd-overrideplayername-desc = Changes the name used when attempting to connect to the server.
# [AUTO_EN]
cmd-overrideplayername-help = Usage: overrideplayername <name>
# [AUTO_EN]
cmd-showanchored-desc = Displays anchored entities on a specific tile.
# [AUTO_EN]
cmd-showanchored-help = Usage: showanchored
# [AUTO_EN]
cmd-dmetamem-desc = Outputs members of the type in a format suitable for a sandbox configuration file.
# [AUTO_EN]
cmd-dmetamem-help = Usage: dmetamem <type>
# [AUTO_EN]
cmd-launchauth-desc = Loads authentication tokens from launcher data to assist in testing live servers.
# [AUTO_EN]
cmd-launchauth-help = Usage: launchauth <account name>
# [AUTO_EN]
cmd-lightbb-desc = Enables the display of light bounding boxes.
# [AUTO_EN]
cmd-lightbb-help = Usage: lightbb
# [AUTO_EN]
cmd-monitorinfo-desc = Monitoring information
# [AUTO_EN]
cmd-monitorinfo-help = Usage: monitorinfo <id>
# [AUTO_EN]
cmd-setmonitor-desc = Sets monitor
# [AUTO_EN]
cmd-setmonitor-help = Usage: setmonitor <id>
# [AUTO_EN]
cmd-physics-desc = Displays the debug physics overlay. The argument specifies the overlay.
# [AUTO_EN]
cmd-physics-help = Usage: physics <aabbs / com / contactnormals / contactpoints / distance / joints / shapeinfo / shapes>
# [AUTO_EN]
cmd-hardquit-desc = Immediately closes the game client.
# [AUTO_EN]
cmd-hardquit-help = Immediately closes the game client without leaving a trace. No goodbye to the server.
# [AUTO_EN]
cmd-quit-desc = Correctly closes the game client.
# [AUTO_EN]
cmd-quit-help = Correctly closes the game client, notifying the connected server and so on.
# [AUTO_EN]
cmd-csi-desc = Opens the interactive C# console.
# [AUTO_EN]
cmd-csi-help = Usage: csi
# [AUTO_EN]
cmd-scsi-desc = Opens an interactive C# console on the server.
# [AUTO_EN]
cmd-scsi-help = Usage: scsi
# [AUTO_EN]
cmd-watch-desc = Opens the variable watch window.
# [AUTO_EN]
cmd-watch-help = Usage: watch
# [AUTO_EN]
cmd-showspritebb-desc = Enables or disables sprite border display.
# [AUTO_EN]
cmd-showspritebb-help = Usage: showspritebb
# [AUTO_EN]
cmd-togglelookup-desc = Shows / hides entitylookup boundaries via overlay.
# [AUTO_EN]
cmd-togglelookup-help = Usage: togglelookup
# [AUTO_EN]
cmd-net_entityreport-desc = Enables or disables the network entity reports panel.
# [AUTO_EN]
cmd-net_entityreport-help = Usage: net_entityreport
# [AUTO_EN]
cmd-net_refresh-desc = Requests the full server status.
# [AUTO_EN]
cmd-net_refresh-help = Usage: net_refresh
# [AUTO_EN]
cmd-net_graph-desc = Enables or disables the network statistics panel.
# [AUTO_EN]
cmd-net_graph-help = Usage: net_graph
# [AUTO_EN]
cmd-net_watchent-desc = Outputs all network updates for EntityId to the console.
# [AUTO_EN]
cmd-net_watchent-help = Usage: net_watchent <0|EntityUid>
# [AUTO_EN]
cmd-net_draw_interp-desc = Enables or disables debug display of network interpolation.
# [AUTO_EN]
cmd-net_draw_interp-help = Usage: net_draw_interp <0|EntityUid>
# [AUTO_EN]
cmd-vram-desc = Displays statistics on the game's video memory usage.
# [AUTO_EN]
cmd-vram-help = Usage: vram
# [AUTO_EN]
cmd-showislands-desc = Displays the current physical bodies involved in each physical island.
# [AUTO_EN]
cmd-showislands-help = Usage: showislands
# [AUTO_EN]
cmd-showgridnodes-desc = Displays nodes for grid splitting.
# [AUTO_EN]
cmd-showgridnodes-help = Usage: showgridnodes
# [AUTO_EN]
cmd-profsnap-desc = Creates a profiling snapshot.
# [AUTO_EN]
cmd-profsnap-help = Usage: profsnap
# [AUTO_EN]
cmd-devwindow-desc = Development window
# [AUTO_EN]
cmd-devwindow-help = Usage: devwindow
# [AUTO_EN]
cmd-scene-desc = Immediately changes the UI scene/state.
# [AUTO_EN]
cmd-scene-help = Usage: scene <className>
# [AUTO_EN]
cmd-szr_stats-desc = Serializer statistics report.
# [AUTO_EN]
cmd-szr_stats-help = Usage: szr_stats
# [AUTO_EN]
cmd-hwid-desc = Returns the current HWID (hardware identifier).
# [AUTO_EN]
cmd-hwid-help = Usage: hwid
# [AUTO_EN]
cmd-vvread-desc = Extracts the path value using VV (View Variables).
# [AUTO_EN]
cmd-vvwrite-desc = Changes the path value using VV (View Variables).
# [AUTO_EN]
cmd-vvwrite-help = Usage: vvwrite <path>
# [AUTO_EN]
cmd-vvinvoke-desc = Invokes/Invokes a path with arguments using VV.
# [AUTO_EN]
cmd-vvinvoke-help = Usage: vvinvoke <path> [arguments...]
# [AUTO_EN]
cmd-dump_dependency_injectors-desc = Outputs the cache of dependency injectors from IoCManager.
# [AUTO_EN]
cmd-dump_dependency_injectors-help = Usage: dump_dependency_injectors
# [AUTO_EN]
cmd-dump_dependency_injectors-total-count = Total: { $total }
# [AUTO_EN]
cmd-dump_netserializer_type_map-desc = Outputs the type map and hash of the NetSerializer serializer.
# [AUTO_EN]
cmd-dump_netserializer_type_map-help = Usage: dump_netserializer_type_map
# [AUTO_EN]
cmd-hub_advertise_now-desc = Immediately advertises on the main hub server.
# [AUTO_EN]
cmd-hub_advertise_now-help = Usage: hub_advertise_now
# [AUTO_EN]
cmd-echo-desc = Returns arguments back to the console.
# [AUTO_EN]
cmd-echo-help = Usage: echo "<message>"
# [AUTO_EN]
cmd-vfs_ls-desc = Directory listing in VFS.
# [AUTO_EN]
cmd-vfs_ls-help =
    Usage: vfs_list <path>
    Example:
    vfs_list /Assemblies
# [AUTO_EN]
cmd-vfs_ls-err-args = Exactly 1 argument is required.
cmd-vfs_ls-hint-path = <path>
