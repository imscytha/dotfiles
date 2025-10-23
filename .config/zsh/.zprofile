OS=$(uname)

# =============================================================================
#                           Platform specific configs
# =============================================================================
# INFO: Sources platform-specific variables that might differ depending on the
#       platform (e.g `JAVA_HOME`, `DOTNET_ROOT`, etc.)
# WARN: The following configuration depends on these variables being set in
#       advance.
if [[ "$OS" == "Darwin" ]]; then
    source "$ZDOTDIR/.zprofile.osx"
elif [[ "$OS" == "Linux" ]]; then
    source "$ZDOTDIR/.zprofile.linux"
fi

# =============================================================================
#                                      .NET
# =============================================================================
export PATH="$PATH:$DOTNET_TOOLS"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_ENVIRONMENT=Localhost                            # don't even ask

# =============================================================================
#                                    Android
# =============================================================================
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/emulator"

# =============================================================================
#                                     Java
# =============================================================================
export PATH="$PATH:$JAVA_HOME/bin"
