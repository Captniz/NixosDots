{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

let
  colors = import ../Themes/${userSettings.theme}/Colors.nix;
in
{
  imports = [
    ../Themes/${userSettings.theme}/Vscode-override.nix
  ];
  programs.vscode = {
    enable = true;
    profiles.default.userSettings = {
      # General
      "files.autoSave" = "afterDelay";
      "editor.formatOnSave" = true;
      "editor.codeActionsOnSave" = { };
      "update.mode" = "none";
      "editor.tabSize" = 4;
      "editor.indentSize" = "tabSize";
      "python.pythonPath"= "/run/current-system/sw/bin/python";
      "python.defaultInterpreterPath"= "/run/current-system/sw/bin/python";
      "pylint.interpreter"= ["/run/current-system/sw/bin/python"];
      "[qml]"= {"editor.defaultFormatter"= "Delgan.qml-format";};

      # Themeing
      "editor.cursorSmoothCaretAnimation" = "on";
      "workbench.colorTheme" = "Gruvbox Dark Medium";
      "workbench.iconTheme" = "gruvbox-material-icon-theme";
      "window.menuBarVisibility" = "toggle";
      "editor.fontFamily" = "FiraCode Nerd Font,FiraCode Nerd Font Ret";
      "editor.fontSize" = 16;
      "editor.wordWrap" = "on";
      "editor.fontLigatures" = true;
      "editor.guides.bracketPairs" = true;
      "editor.guides.bracketPairsHorizontal" = true;
      "material-icon-theme.folders.color" = "#26a69a";
      "editor.language.colorizedBracketPairs" = [
        [
          "["
          "]"
        ]
        [
          "("
          ")"
        ]
        [
          "{"
          "}"
        ]
      ];
      "workbench.colorCustomizations" = {
        "[Monochrome Light Amplified]" = {
          "editorBracketHighlight.foreground1" = "#FCA311";
          "editorBracketHighlight.foreground2" = "#F9901C";
          "editorBracketHighlight.foreground3" = "#F57D26";
          "editorBracketHighlight.foreground4" = "#F7693C";
          "editorBracketHighlight.foreground5" = "#F85552";
          "editorBracketHighlight.foreground6" = "#e14d4b";
        };
        "[Monochrome Dark Amplified]" = {
          "editorBracketHighlight.foreground1" = "#BE6969";
          "editorBracketHighlight.foreground2" = "#D17374";
          "editorBracketHighlight.foreground3" = "#E67E80";
          "editorBracketHighlight.foreground4" = "#DE8C9B";
          "editorBracketHighlight.foreground5" = "#D699B6";
          "editorBracketHighlight.foreground6" = "#DAA2BD";
        };
      };

      # Suggestion and completion
      "editor.inlineSuggest.enabled" = true;
      "editor.autoClosingBrackets" = "never";
      "editor.autoClosingQuotes" = "never";
      "[python]" = {
        "editor.formatOnType" = true;
      };
      "omnisharp.enableRoslynAnalyzers" = true;
      "dotnet.inlayHints.enableInlayHintsForParameters" = true;
      "dotnet.inlayHints.enableInlayHintsForLiteralParameters" = true;
      "dotnet.inlayHints.enableInlayHintsForObjectCreationParameters" = true;
      "dotnet.inlayHints.enableInlayHintsForOtherParameters" = true;
      "csharp.inlayHints.enableInlayHintsForTypes" = true;
      "dotnet.completion.showCompletionItemsFromUnimportedNamespaces" = true;

      # Git
      "git.enableSmartCommit" = true;
      "git.confirmSync" = false;
      "git.openRepositoryInParentFolders" = "never";
      "github.copilot.enable" = {
        "markdown" = "true";
      };
      "github.copilot.advanced" = { };
      "github.copilot.editor.enableAutoCompletions" = true;

      # Extensions
      "[java]"= {
		    "editor.defaultFormatter"= "redhat.java";
	    };
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "leetcode.workspaceFolder" = "/home/simo/Documents/Repos/Uni_Code/LEETCODE_SOL";
      "vsicons.dontShowNewVersionMessage" = true;
      "open-in-browser.default" = "firefox";
      "liveSassCompile.settings.showOutputWindowOn" = "None";
      "prettier.useTabs" = true;
      "better-comments.tags" = [
        {
          "tag" = "!";
          "color" = "#FF2D00";
          "strikethrough" = false;
          "underline" = false;
          "backgroundColor" = "transparent";
          "bold" = false;
          "italic" = false;
        }
        {
          "tag" = "?";
          "color" = "#3498DB";
          "strikethrough" = false;
          "underline" = false;
          "backgroundColor" = "transparent";
          "bold" = false;
          "italic" = false;
        }
        {
          "tag" = "//";
          "color" = "#474747";
          "strikethrough" = true;
          "underline" = false;
          "backgroundColor" = "transparent";
          "bold" = false;
          "italic" = false;
        }
        {
          "tag" = "todo";
          "color" = "#FF8C00";
          "strikethrough" = false;
          "underline" = false;
          "backgroundColor" = "transparent";
          "bold" = false;
          "italic" = false;
        }
        {
          "tag" = "*";
          "color" = "#98C379";
          "strikethrough" = false;
          "underline" = false;
          "backgroundColor" = "transparent";
          "bold" = false;
          "italic" = false;
        }
      ];
      "java.home" = "/run/current-system/sw/lib/openjdk";
      "java.jdt.ls.java.home" = "/run/current-system/sw/lib/openjdk";
      "java.configuration.runtimes" = [ ];
      "java.codeAction.sortMembers.avoidVolatileChanges" = false;
      "java.project.outputPath"= "out";

      # Code runner
      "code-runner.clearPreviousOutput" = true;
      "code-runner.runInTerminal" = true;
      "code-runner.executorMapByGlob" = {
        "Cargo.toml" = "cd $dir && cargo run";
      };
      "code-runner.executorMapByFileExtension" = {
        ".poly" = "cd $dir && poly < $fileName"; # polyml
      };
      "code-runner.executorMap" = {
        "javascript" = "node";
        "java" = "cd $dir && javac 2>/dev/null $fileName && java 2>/dev/null $fileNameWithoutExt";
        "c" = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
        "zig" = "zig run";
        "cpp" = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
        "objective-c" =
          "cd $dir && gcc -framework Cocoa $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
        "php" = "cd $dir && sh FileTransfer.sh";
        "python" = "python -u";
        "perl" = "perl";
        "perl6" = "perl6";
        "ruby" = "ruby";
        "go" = "go run";
        "lua" = "lua";
        "groovy" = "groovy";
        "powershell" = "powershell -ExecutionPolicy ByPass -File";
        "bat" = "cmd /c";
        "shellscript" = "bash";
        "fsharp" = "fsi";
        "csharp" = "mcs $dir$fileName && mono $dir$fileNameWithoutExt.exe";
        "vbscript" = "cscript //Nologo";
        "typescript" = "ts-node";
        "coffeescript" = "coffee";
        "scala" = "scala";
        "swift" = "swift";
        "julia" = "julia";
        "crystal" = "crystal";
        "ocaml" = "ocaml";
        "r" = "Rscript";
        "applescript" = "osascript";
        "clojure" = "lein exec";
        "haxe" = "haxe --cwd $dirWithoutTrailingSlash --run $fileNameWithoutExt";
        "rust" = "cd $dir && rustc $fileName && $dir$fileNameWithoutExt";
        "racket" = "racket";
        "scheme" = "csi -script";
        "ahk" = "autohotkey";
        "autoit" = "autoit3";
        "dart" = "dart";
        "pascal" = "cd $dir && fpc $fileName && $dir$fileNameWithoutExt";
        "d" = "cd $dir && dmd $fileName && $dir$fileNameWithoutExt";
        "haskell" = "runghc";
        "nim" = "nim compile --verbosity:0 --hints:off --run";
        "lisp" = "sbcl --script";
        "kit" = "kitc --run";
        "v" = "v run";
        "sass" = "sass --style expanded";
        "scss" = "scss --style expanded";
        "less" = "cd $dir && lessc $fileName $fileNameWithoutExt.css";
        "FortranFreeForm" =
          "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
        "fortran-modern" =
          "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
        "fortran_fixed-form" =
          "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
        "fortran" = "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
        "sml" = "cd $dir && poly < $fileName";
        "sql" = "cd $dir && sh FileTransfer.sh";
      };
    };
  };
}
