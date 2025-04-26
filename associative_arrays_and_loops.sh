#!/bin/bash

# Create a more sophisticated script that uses arrays for mapping
echo '#!/bin/bash

# Starting from project root
cd $(pwd)

# Define file mappings using associative arrays
declare -A code_files=(
  ["campus-ambas/code/#=Educational research as a undergraduat.jl"]="campus-ambas/code/FractalCommunicationFramework_Basic.jl"
  ["campus-ambas/code/Educational research, as well as persona.jl"]="campus-ambas/code/FractalCommunicationFramework_Extended.jl"
  ["campus-ambas/code/fractal_code_analysis_workflow.jl"]="campus-ambas/code/FractalCodeAnalysis_Workflow.jl"
)

declare -A docs_files=(
  ["campus-ambas/docs/<Claude Code as described in Claude Code.md"]="campus-ambas/docs/Claude-Code-Security-Analysis.md"
  ["campus-ambas/docs/<fractal_analysis>.md"]="campus-ambas/docs/Fractal-Analysis-Template.md"
  ["campus-ambas/docs/CLAUDE.md"]="campus-ambas/docs/Claude-Configuration-Guide.md"
  ["campus-ambas/docs/Claude Code overview.md"]="campus-ambas/docs/Claude-Code-Overview.md"
  ["campus-ambas/docs/Epistemic_Fractal_Analysis.md"]="campus-ambas/docs/Epistemic-Fractal-Analysis.md"
  ["campus-ambas/docs/FractalEnhancement.md"]="campus-ambas/docs/Fractal-Framework-Enhancement.md"
  ["campus-ambas/docs/gemini-predictEdDiscuss.md"]="campus-ambas/docs/Gemini-PredictED-Discussion.md"
  ["campus-ambas/docs/how-to-prompt.md"]="campus-ambas/docs/Claude-Prompting-Guide.md"
  ["campus-ambas/docs/Implementing_Fractal_Methodology.md"]="campus-ambas/docs/Implementing-Fractal-Methodology.md"
  ["campus-ambas/docs/learning.md"]="campus-ambas/docs/Learning-Prior-Importance.md"
  ["campus-ambas/docs/Multi-Scale Analysis.md"]="campus-ambas/docs/Multi-Scale-Analysis-Framework.md"
  ["campus-ambas/docs/o4-mini-use-of.md"]="campus-ambas/docs/O4-Mini-Fractal-Framework-Example.md"
  ["campus-ambas/docs/TODO.md"]="campus-ambas/docs/TODO-Gemini-PredictED.md"
)

declare -A settings_files=(
  ["settings-for-zed-and-cursor/current-settings-zed-april.json"]="settings-for-zed-and-cursor/config-zed-april-current.json"
  ["settings-for-zed-and-cursor/cursor-rule-notes-for-ai-max.md"]="settings-for-zed-and-cursor/doc-cursor-ai-rules-extended.md"
  ["settings-for-zed-and-cursor/cursor-rules-rules-for-ai-mini.jl"]="settings-for-zed-and-cursor/rules-cursor-ai-mini.jl"
  ["settings-for-zed-and-cursor/file_Rename.cursorrule"]="settings-for-zed-and-cursor/rule-file-renaming-fractal.cursorrule"
  ["settings-for-zed-and-cursor/grok-mini-resp-to-file-rename.xml"]="settings-for-zed-and-cursor/log-grok-file-rename-response.xml"
  ["settings-for-zed-and-cursor/settings-test.json"]="settings-for-zed-and-cursor/config-zed-test.json"
  ["settings-for-zed-and-cursor/settings-zed-april-need-to-addxai.json"]="settings-for-zed-and-cursor/config-zed-april-xai-pending.json"
)

# Function to rename files with error handling
rename_files() {
  local -n file_map=$1
  for old_name in "${!file_map[@]}"; do
    new_name="${file_map[$old_name]}"
    if [ -f "$old_name" ]; then
      mv "$old_name" "$new_name" && echo "Renamed: $old_name → $new_name" || echo "Error renaming: $old_name"
    else
      echo "Warning: Source file not found: $old_name"
    fi
  done
}

# Execute renames with reporting
echo "Renaming code files..."
rename_files code_files

echo -e "\nRenaming docs files..."
rename_files docs_files

echo -e "\nRenaming settings files..."
rename_files settings_files

echo -e "\nFile renaming complete. ✓"
' > rename_all_files.sh

# Make the script executable
chmod +x rename_all_files.sh

# Run the script
./rename_all_files.sh

# Clean up
rm rename_all_files.sh
