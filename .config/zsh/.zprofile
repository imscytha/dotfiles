eval "$(/opt/homebrew/bin/brew shellenv)"

if [[ -f "$ZDOTDIR/.secrets.sh" ]]; then
    source "$ZDOTDIR/.secrets.sh"
fi

# =============================================================================
#                                      .NET
# =============================================================================
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_ROOT="/usr/local/share/dotnet"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_ENVIRONMENT=Localhost                            # don't even ask
export DOTNET_TOOLS="$HOME/.dotnet/tools"
export PATH="$PATH:$DOTNET_TOOLS"

# =============================================================================
#                                NVM (node stuff)
# =============================================================================
export NVM_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] &&
    \. "/opt/homebrew/opt/nvm/nvm.sh" # loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] &&
    \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # loads completions

# =============================================================================
#                                    Android
# =============================================================================
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/emulator"

# =============================================================================
#                                     Java
# =============================================================================
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export PATH="$PATH:$JAVA_HOME/bin"
