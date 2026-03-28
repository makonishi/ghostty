#!/bin/bash
# PostToolUse hook: configのkeybind変更時にREADME.md更新を強制

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# ghostty configファイルの変更かチェック（README.md自体の変更は除外）
if [[ "$FILE_PATH" == *"/.config/ghostty/config" ]]; then
  echo '{"decision":"block","reason":"ghostty configが変更されました。README.mdのキーバインド一覧も必ず同期更新してください。"}'
  exit 0
fi

exit 0
