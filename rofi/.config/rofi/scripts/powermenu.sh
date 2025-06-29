#!/usr/bin/env bash
set -euo pipefail

all=(shutdown reboot suspend hibernate logout lockscreen)

show=("${all[@]}")

declare -A texts=(
  [lockscreen]="lock screen"
  [logout]="log out"
  [suspend]="suspend"
  [hibernate]="hibernate"
  [reboot]="reboot"
  [shutdown]="shut down"
)

declare -A icons=(
  [lockscreen]="\Uf033e"
  [logout]="\Uf0343"
  [suspend]="\Uf04b2"
  [hibernate]="\Uf02ca"
  [reboot]="\Uf0709"
  [shutdown]="\Uf0425"
  [cancel]="\Uf0156"
)

declare -A actions=(
  [lockscreen]="loginctl lock-session ${XDG_SESSION_ID-}"
  [logout]="i3-msg exit"
  [suspend]="systemctl suspend"
  [hibernate]="systemctl hibernate"
  [reboot]="systemctl reboot"
  [shutdown]="systemctl poweroff"
)

confirmations=(reboot shutdown logout)

dryrun=false
showsymbols=true
showtext=true

check_valid() {
  local option="$1"; shift
  for entry in "$@"; do
    if [[ -z "${actions[$entry]+x}" ]]; then
      echo "Invalid choice: $entry" >&2
      exit 1
    fi
  done
}

parsed=$(getopt --options=h --longoptions=help,dry-run,confirm:,choices:,choose:,symbols,no-symbols,text,no-text,symbols-font: --name "$0" -- "$@")
eval set -- "$parsed"

while true; do
  case "$1" in
    -h|--help) echo "Help info"; exit 0 ;;
    --dry-run) dryrun=true; shift ;;
    --confirm) IFS='/' read -ra confirmations <<< "$2"; check_valid "$1" "${confirmations[@]}"; shift 2 ;;
    --choices) IFS='/' read -ra show <<< "$2"; check_valid "$1" "${show[@]}"; shift 2 ;;
    --choose) check_valid "$1" "$2"; selectionID="$2"; shift 2 ;;
    --symbols) showsymbols=true; shift ;;
    --no-symbols) showsymbols=false; shift ;;
    --text) showtext=true; shift ;;
    --no-text) showtext=false; shift ;;
    --symbols-font) symbols_font="$2"; shift 2 ;;
    --) shift; break ;;
    *) echo "Internal error" >&2; exit 1 ;;
  esac
done

if [[ "$showsymbols" == false && "$showtext" == false ]]; then
  echo "Cannot disable both symbols and text" >&2
  exit 1
fi

write_message() {
  local icon="<span font_size=\"medium\">$1</span>"
  [[ -n "${symbols_font:-}" ]] && icon="<span font=\"${symbols_font}\" font_size=\"medium\">$1</span>"
  local text="<span font_size=\"medium\">$2</span>"
  if [[ "$showsymbols" == true ]]; then
    [[ "$showtext" == true ]] && echo -n $'\u200e'"$icon"$'\u2068'" $text"$'\u2069' || echo -n "$icon"
  else
    echo -n "$text"
  fi
}

print_selection() {
  echo -e "$1"
}

declare -A messages
declare -A confirmationMessages

for entry in "${all[@]}"; do
  messages[$entry]=$(write_message "${icons[$entry]}" "${texts[$entry]^}")
  confirmationMessages[$entry]=$(write_message "${icons[$entry]}\u200b" "Yes, ${texts[$entry]}")
done

confirmationMessages[cancel]=$(write_message "${icons[cancel]}" "No, cancel")

if [[ $# -gt 0 ]]; then
  selection="$*"
elif [[ -n "${selectionID:-}" ]]; then
  selection="${messages[$selectionID]}"
fi

echo -e "\0no-custom\x1ftrue"
echo -e "\0markup-rows\x1ftrue"

if [[ -z "${selection:-}" ]]; then
  echo -e "\0prompt\x1f⏻ Power"
  for entry in "${show[@]}"; do
    echo -e "${messages[$entry]}\0icon\x1f${icons[$entry]}"
  done
else
  for entry in "${show[@]}"; do
    if [[ "$selection" == "$(print_selection "${messages[$entry]}")" ]]; then
      for confirm in "${confirmations[@]}"; do
        [[ "$entry" == "$confirm" ]] && {
          echo -e "\0prompt\x1fAre you sure"
          echo -e "${confirmationMessages[$entry]}\0icon\x1f${icons[$entry]}"
          echo -e "${confirmationMessages[cancel]}\0icon\x1f${icons[cancel]}"
          exit 0
        }
      done
      selection=$(print_selection "${confirmationMessages[$entry]}")
    fi
    if [[ "$selection" == "$(print_selection "${confirmationMessages[$entry]}")" ]]; then
      $dryrun && echo "Selected: $entry" >&2 || ${actions[$entry]}
      exit 0
    fi
    [[ "$selection" == "$(print_selection "${confirmationMessages[cancel]}")" ]] && exit 0
  done
  echo "Invalid selection: $selection" >&2
  exit 1
fi
