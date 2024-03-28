app: jetbrains
-
tag(): user.line_commands
tag(): user.multiple_cursors
tag(): user.splits
tag(): user.tabs
# multiple_cursors.py support end

# Auto complete
complete: user.idea("action CodeCompletion")
perfect: user.idea("action CodeCompletion,action CodeCompletion")
smart: user.idea("action SmartTypeCompletion")
# (done | finish): user.idea("action EditorCompleteStatement")
quick fix: user.idea("action ShowIntentionActions")
# Copying
grab <number>: user.idea_grab(number)

# Actions
(action | please): user.idea("action GotoAction")
(action | please) <user.text>:
    user.idea("action GotoAction")
    insert(text)
import project: user.idea("action ImportModule")
maven update: user.idea("action Maven.Reimport")

# Refactoring
refactor: user.idea("action Refactorings.QuickListPopupAction")
refactor <user.text>:
    user.idea("action Refactorings.QuickListPopupAction")
    insert(text)
extract (variable|local): user.idea("action IntroduceVariable")
extract field: user.idea("action IntroduceField")
extract constant: user.idea("action IntroduceConstant")
extract parameter: user.idea("action IntroduceParameter")
extract interface: user.idea("action ExtractInterface")
extract method: user.idea("action ExtractMethod")
in line: user.idea("action Inline")
refactor move: user.idea("action Move")
rename: user.idea("action RenameElement")
rename file: user.idea("action RenameFile")
format code: user.idea("action ShowReformatFileDialog")
# format code: user.idea("action ReformatCode")
do imports: user.idea("action OptimizeImports")

# Editing
snip: user.idea("action EditorDeleteLine")
mirror: user.idea("action EditorDuplicate")
slide up: key(ctrl-shift-up)
slide down: key(ctrl-shift-down)

#navigation
tunnel: user.idea("action GotoDeclaration")
go matching: user.idea("action EditorMatchBrace")
go implementation: user.idea("action GotoImplementation")
go super: user.idea("action GotoSuperMethod")
references: user.idea("action FindUsages")
go type: user.idea("action GotoTypeDeclaration")
go test: user.idea("action GotoTest")
retreat: user.idea("action Back")
advance: user.idea("action Forward")
last edit location: key(ctrl-shift-backspace)
method next: user.idea("action MethodDown")
method prior: user.idea("action MethodUp")
method references:
    key(end)
    user.idea("action MethodUp")
    user.idea("action FindUsages")

# Search
find (everywhere | all): user.idea("action SearchEverywhere")
find (everywhere | all) <user.text> [over]:
    user.idea("action SearchEverywhere")
    sleep(500ms)
    insert(text)
(search | find) class: user.idea("action GotoClass")
open resource: user.idea("action GotoFile")
open <user.text>:
    user.idea("action GotoClass")
    user.insert_formatted(text, "CAPITALIZE_ALL_WORDS,NO_SPACES")
search it: user.idea("action FindInPath")
(search | find) symbol: user.idea("action GotoSymbol")
(search | find) symbol <user.text>$:
    user.idea("action GotoSymbol")
    insert(text)
    key("enter")
recent: user.idea("action RecentFiles")
replace all: key(ctrl-shift-r)

surround with:
    user.idea("action SurroundWith")
surround [this] with <user.text> [over]:
    user.idea("action SurroundWith")
    sleep(500ms)
    insert(text)
# Making these longer to reduce collisions with real code dictation.
insert generated:
# generate:
    user.idea("action Generate")
#todo plate
insert template <user.text> [over]:
    user.idea("action InsertLiveTemplate")
    sleep(500ms)
    insert(text)
create (template | snippet): user.idea("action SaveAsTemplate")

# Recording
toggle recording: user.idea("action StartStopMacroRecording")
change (recording | recordings): user.idea("action EditMacros")
play recording: user.idea("action PlaybackLastMacro")
play recording <user.text> [over]:
    user.idea("action PlaySavedMacrosAction")
    insert(text)
    sleep(500ms)
    Key("enter")
    
# Marks
go mark: user.idea("action ShowBookmarks")
toggle mark: user.idea("action ToggleBookmark")
go next mark: user.idea("action GotoNextBookmark")
go last mark: user.idea("action GotoPreviousBookmark")
toggle mark <number>: user.idea("action ToggleBookmark{number}")
go mark <number>: user.idea("action GotoBookmark{number}")

# Folding
expand:
    # key(ctrl-plus)
    user.idea("action ExpandRegion")
collapse:
    user.idea("action CollapseRegion")
#expand deep: user.idea("action ExpandRegionRecursively")
#expand all: user.idea("action ExpandAllRegions")
expand all: key(ctrl-equals)
#collapse deep: user.idea("action CollapseRegionRecursively")
collapse all: key(ctrl-minus)
#collapse all: user.idea("action CollapseAllRegions")
# miscellaneous
# XXX These might be better than the structural ones depending on language.

# Clipboard
clippings: user.idea("action PasteMultiple")
copy path: user.idea("action CopyPaths")
copy reference: user.idea("action CopyReference")
copy pretty: user.idea("action CopyAsRichText")
# File Creation
create sibling: user.idea("action NewElementSamePlace")
create sibling <user.text> [over]:
    user.idea("action NewElementSamePlace")
    sleep(500ms)
    insert(text)
(create|generate) file: user.idea("action NewElement")
# create file <user.text> [over]:
#     user.idea("action NewElement")
#     sleep(500ms)
#     insert(text)
# Task Management
go task: user.idea("action tasks.goto")
go browser task: user.idea("action tasks.open.in.browser")
switch task: user.idea("action tasks.switch")
clear task: user.idea("action tasks.close")
configure servers: user.idea("action tasks.configure.servers")
# Git / Github (not using verb-noun-adjective pattern, mirroring terminal commands.)
git pull: user.idea("action Vcs.UpdateProject")
git commit: user.idea("action CheckinProject")
# git push: user.idea("action CheckinProject")
git push: key(ctrl-shift-k)
git commit push: user.idea("action Git.Commit.And.Push.Executor")
git log: user.idea("action Vcs.ShowTabbedFileHistory")
git browse: user.idea("action Github.Open.In.Browser")
git (gets | gist): user.idea("action Github.Create.Gist")
git (pull request | request): user.idea("action Github.Create.Pull.Request")
git (view | show | list) (requests | request):
    user.idea("action Github.View.Pull.Request")
git (annotate | blame): user.idea("action Annotate")
git menu: user.idea("action Vcs.QuickListPopupAction")
git branches|git branch list: key(ctrl-shift-`)
git stash push: user.idea("action Git.Stash")
git stash apply: user.idea("action Git.Unstash")
git fetch: user.idea("action Git.Fetch")
# git add: user.idea("action ChangesView.AddUnversioned")
git add: key(ctrl-alt-a)
#git branches: user.idea("action Branches...")
show history: user.idea("action ShowHistory")
rollback: key(ctrl-alt-z)

# Tool windows:
# Toggling various tool windows
view services: user.idea("action ActivateServicesToolWindow")
view variables:
    key(escape)
    user.idea("action ActivateServicesToolWindow")
    # key(tab)
view stack:
    key(escape)
    user.idea("action ActivateServicesToolWindow")
    key(shift-tab)
# view debug:
#     user.idea("action ActivateServicesToolWindow")
#     key(tab)
#     key(tab)
view explore: user.idea("action ActivateProjectToolWindow")
view problems: user.idea("action ActivateProblemsViewToolWindow")
view search: user.idea("action ActivateFindToolWindow")
view run: user.idea("action ActivateRunToolWindow")
view debug: user.idea("action ActivateDebugToolWindow")
view events: user.idea("action ActivateEventLogToolWindow")
view terminal: user.idea("action ActivateTerminalToolWindow")
view git: user.idea("action ActivateVersionControlToolWindow")
view commit: user.idea("action ActivateCommitToolWindow")
view outline: user.idea("action ActivateStructureToolWindow")
view database: user.idea("action ActivateDatabaseToolWindow")
view database changes: user.idea("action ActivateDatabaseChangesToolWindow")
view make: user.idea("action ActivatemakeToolWindow")
view to do: user.idea("action ActivateTODOToolWindow")
view docker: user.idea("action ActivateDockerToolWindow")
view favorites: user.idea("action ActivateFavoritesToolWindow")
view messages: user.idea("action ActivateMessagesToolWindow")
view maven: user.idea("action ActivateMavenToolWindow")
view duplicates: user.idea("action ActivateDuplicatesToolWindow")
view build: user.idea("action ActivateBuildToolWindow")
view bookmarks: user.idea("action ActivateBookmarksToolWindow")
view last: user.idea("action JumpToLastWindow")
view close: user.idea("action HideActiveWindow")
# Pin/dock/float
toggle pinned: user.idea("action TogglePinnedMode")
toggle docked: user.idea("action ToggleDockMode")
toggle floating: user.idea("action ToggleFloatingMode")
toggle windowed: user.idea("action ToggleWindowedMode")
toggle split: user.idea("action ToggleSideMode")
# Settings, not windows
toggle tool buttons: user.idea("action ViewToolButtons")
toggle toolbar: user.idea("action ViewToolBar")
toggle status [bar]: user.idea("action ViewStatusBar")
toggle navigation [bar]: user.idea("action ViewNavigationBar")
# Active editor settings
toggle power save: user.idea("action TogglePowerSave")
toggle whitespace: user.idea("action EditorToggleShowWhitespaces")
toggle indents: user.idea("action EditorToggleShowIndentLines")
toggle line numbers: user.idea("action EditorToggleShowLineNumbers")
toggle (bread crumbs | breadcrumbs): user.idea("action EditorToggleShowBreadcrumbs")
toggle gutter icons: user.idea("action EditorToggleShowGutterIcons")
toggle wrap: user.idea("action EditorToggleUseSoftWraps")
toggle parameters: user.idea("action ToggleInlineHintsAction")
# Toggleable views
toggle fullscreen: user.idea("action ToggleFullScreen")
toggle distraction [free mode]: user.idea("action ToggleDistractionFreeMode")
toggle presentation [mode]: user.idea("action TogglePresentationMode")
# Toggle additionals
comment: code.toggle_comment()
# Quick popups
change scheme: user.idea("action QuickChangeScheme")
# Always javadoc
(toggle | pop) (doc | documentation): user.idea("action QuickJavaDoc")
(pop deaf | toggle definition): user.idea("action QuickImplementations")
pop type: user.idea("action ExpressionTypeInfo")
pop parameters: user.idea("action ParameterInfo")
# Breakpoints / debugging
go breakpoints: user.idea("action ViewBreakpoints")
breakpoint: user.idea("action ToggleLineBreakpoint")
condition breakpoint: key(ctrl-shift-f8)
toggle method breakpoint: user.idea("action ToggleMethodBreakpoint")
mute breakpoints: user.idea("action XDebugger.MuteBreakpoints")
run menu: user.idea("action ChooseRunConfiguration")
run test: user.idea("action RunClass")
run last test: user.idea("action Rerun")
debug test: user.idea("action DebugClass")
debug last test: key(shift-f9)
run project test:
    user.idea("action ActivateProjectToolWindow")
    sleep(100ms)
    key(ctrl-minus)
    sleep(100ms)
    key(ctrl-shift-f10)
step over: user.idea("action StepOver")
step in: user.idea("action StepInto")
step out: user.idea("action StepOut")
step smart: user.idea("action SmartStepInto")
step to line: user.idea("action RunToCursor")
drop to frame: user.idea("action Debugger.PopFrame")
resume: user.idea("action Resume")
inspect: key(alt-f8 enter)
# Grow / Shrink
(grow | shrink) window right: user.idea("action ResizeToolWindowRight")
(grow | shrink) window left: user.idea("action ResizeToolWindowLeft")
(grow | shrink) window up: user.idea("action ResizeToolWindowUp")
(grow | shrink) window down: user.idea("action ResizeToolWindowDown")
# Movement
#next occurrence: user.idea("action NextOccurrence")
side next: key(ctrl-alt-down)
side prior: key(ctrl-alt-up)
next: user.idea("action GotoNextError")
prior: user.idea("action GotoPreviousError")
accept: key(alt-shift-enter)
blind accept:
    user.idea("action GotoNextError")
    key(alt-shift-enter)
diff next: key(f7)
diff prior: key(shift-f7)
diff revert: key(ctrl-alt-r)
file next: key(alt-shift-right)
file prior: key(alt-shift-left)
fix next (error | air):
    user.idea("action GotoNextError")
    user.idea("action ShowIntentionActions")
fix last (error | air):
    user.idea("action GotoPreviousError")
    user.idea("action ShowIntentionActions")
# Special Selects
select less: user.idea("action EditorUnSelectWord")
element: user.idea("action EditorSelectWord")
#jet brains-specific line commands. see line_commands.talon for generic ones
expand <number> until <number>:
    user.select_range(number_1, number_2)
    user.idea("action ExpandRegion")
collapse <number> until <number>:
    user.select_range(number_1, number_2)
    user.idea("action CollapseRegion")
paste <number> until <number>:
    user.select_range(number_1, number_2)
    user.idea("action EditorPaste")
refactor <number> until <number>:
    user.select_range(number_1, number_2)
    user.idea("action Refactorings.QuickListPopupAction")
bring row <number>: user.line_clone(number)
# move row <number>:
    # user.select_range(number, number)
    # user.idea("action EditorCut")
    # retreat does not work

#find/replace
clear last <user.text> [over]: user.idea("find prev {text}, action EditorBackSpace")
clear next <user.text> [over]: user.idea("find next {text}, action EditorBackSpace")
comment last <user.text> [over]:
    user.idea("find prev {text}, action CommentByLineComment")
comment next <user.text> [over]:
    user.idea("find next {text}, action CommentByLineComment")
go last <user.text> [over]: user.idea("find prev {text}, action EditorRight")
go next <user.text> [over]: user.idea("find next {text}, action EditorRight")
paste last <user.text> [over]:
    user.idea("find prev {text}, action EditorRight, action EditorPaste")
paste next <user.text> [over]:
    user.idea("find next {text}, action EditorRight, action EditorPaste")
refactor last <user.text> [over]:
    user.idea("find prev {text}, action Refactorings.QuickListPopupAction")
refactor next <user.text> [over]:
    user.idea("find next {text}, action Refactorings.QuickListPopupAction")
replace last <user.text> [over]: user.idea("find prev {text}, action EditorPaste")
replace next <user.text> [over]: user.idea("find next {text}, action EditorPaste")
select last <user.text> [over]: user.idea("find prev {text}")
select next <user.text> [over]: user.idea("find next {text}")

take cam left: user.extend_camel_left()
take cam right: user.extend_camel_right()
go cam left: user.camel_left()
go cam right: user.camel_right()
chuck cam left: user.idea("action EditorDeleteToWordStartInDifferentHumpsMode")
chuck cam right: user.idea("action EditorDeleteToWordEndInDifferentHumpsMode")

# requires plug-in: black-pycharm
blacken: user.idea("action BLACKReformatCode")

create new file: user.idea("action NewFile")
create new class: user.idea("action NewClass")
compare files: user.idea("action CompareTwoFiles")

replace it: key(ctrl-r)

# harbour: user.idea("action CloseAllTabs")
tab actions: key(alt-w t)

tomcat publish:
    # key(ctrl-f10)
    user.idea("action UpdateRunningApplication")
tomcat boot: user.debug_file("tomcat")
tomcat stop: key(ctrl-f2)

copy folder name: user.copy_folder_name()

(fetch|go) settings: key(ctrl-alt-s)

plate todo: insert("// TODO ")
plate <user.intellij_templates>:
    user.idea("action InsertLiveTemplate")
    # key(ctrl-j)
    insert(intellij_templates)
    sleep(500ms)
    key(enter)

vim toggle: user.idea("action VimPluginToggle")

go block start: user.idea("action EditorCodeBlockStart")
go block end: user.idea("action EditorCodeBlockEnd")

# no action id
(jump to|go) file: key(f4)
(jump to|go) diff: user.idea("action Compare.SameVersion")

plain copy that: user.idea("action CopyAsPlainText")
split move: user.idea("action MoveEditorToOppositeTabGroup")