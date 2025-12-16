case "$(uname -s)" in
    Linux*)  export _PLATFORM="linux" ;;
    Darwin*) export _PLATFORM="mac" ;;
    *)       export _PLATFORM="unknown" ;;
esac

ZPROFILE_DIR="$ZDOTDIR/.zprofile.d"

# =============================================================================
#                           Platform specific configs
# =============================================================================
# INFO: Sources platform-specific variables that might differ depending on the
#       platform (e.g `JAVA_HOME`, `DOTNET_ROOT`, etc.)
# WARN: The following configuration depends on these variables being set in
#       advance.
source "$ZPROFILE_DIR/.zprofile.$_PLATFORM"

# =============================================================================
#                                      .NET
# =============================================================================
export DOTNET_ROOT="/usr/local/share/dotnet"
export DOTNET_TOOLS="$HOME/.dotnet/tools"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_ENVIRONMENT=Development
export PATH="$PATH:$DOTNET_TOOLS"

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
