# Todotxt-cli Reference File

## Workflow Overview

Use `tfgalloc` whenever time allocations need adjustment.

1. Review this past week with `tws` and `tgw`. Clean up anything that needs it.
2. Dump task ideas into `dump.txt` throughout the week.
3. Move tasks from `dump.txt` into `todo.txt`, adding priority, deferral/due dates, estimated time, context, and project as you do.
4. Go through all todos. If you aren't starting it this upcoming week, set a deferral date for next week.
5. Make sure you've added enough tasks for each category in `tfgalloc`.
6. Assign tasks to specific days. Aim for three to four goals that take about two hours or less.
  - If goals take longer than that, it can probably be broken down further.
7. 

## Main Todotxt Commands

- todo.sh: `todo.sh -c -t -d ~/.config/todo/config`
- todo: `vim $HOME/todo/todo.txt`
- tpr: `clear;todo.sh -c -t -d ~/.config/todo/config`
- tfg: `vim ~/.config/todo/config`
- tap: `todo.sh app`
- tdp: `todo.sh depri`
- tpp: `todo.sh prep`
- tp: `todo.sh pri`
- trp: `_t replace`
- tdo: `todo.sh do`

```bash
t () {
  clear
  if [ $# -eq 0 ]; then
    todo.sh view project
  else
    todo.sh -c -t -d "~/.config/todo/config" "$@"
  fi
}
```

## Plugins

### again

#### again aliases

* tag: `todo.sh again`

#### again notes

* `todo.sh again N`: mark item N as done and recreate it. creation and due date set to today. deferral date unchanged.
* `todo.sh again N ADJUST`: mark N done. recreate it. creation = today. due / deferral = ADJUST from today.
* `todo.sh again N +ADJUST`: mark N done. recreate it. creation = today. due / deferral = ADJUST from previous values.
* `t:DATE`: can set deferral dates that will be adjusted along with due dates.
* `ADJUST format`: (+)X(d|b|w|m|y) - days | business days | weeks | months | years

### chcon

#### chcon aliases

* tch: `todo.sh chcon`

#### chcon notes

* `todo.sh chcon N @context`: replaces item N with entered context. give no context to remove all context.

### donow

#### donow aliases

* tdn: `todo.sh donow`

#### donow notes

* `$HOME/todo/evidence.log`: log file for all `donow` entries

### due

#### aliases

* tdu: `clear;todo.sh due`

#### notes

* `todo.sh due N`: shows tasks due within next N days
* `due:YYYY-MM-DD`: use this tag in tasks to mark due dates

### graph

#### graph aliases

* tg: `clear;todo.sh graph 30`
* tgr: `clear;todo.sh graph`
* tgw: `clear;todo.sh graph 7`

#### graph notes

* `todo.sh graph N`: visualize last N days of tasks

### many

#### many aliases

* tm: `_t many`

#### many notes

* `todo.sh many ACTION ITEMS COMMAND`: applies multiple commands from action to items
  * `todo.sh many pri 1-3,5 b`: marks items 1, 2, 3, and 5 priority (B)
  * `todo.sh many depri /@Phone/`: deprioritizes all tasks with context @Phone

### view

#### view aliases

* tv: `clear;todo.sh view`
* tvc: `clear;todo.sh view context`
* tvp: `clear;todo.sh view project`

#### view notes

* `todo.sh view project`: shows items grouped by project
* `todo.sh view project @context`: shows items grouped by project and filtered by @context
* `todo.sh view date +project`: shows items grouped by date and filtered by project
* `todo.sh view after`: shows items grouped by date after and with today
* `todo.sh view before`: shows items grouped by date before and with today
* `todo.sh view before +project`: shows items grouped by date before and with today and filtered by +project

### wp

#### wp aliases

* tfgalloc: `vim ~/.config/todo/.actions.d/wp/allocations.conf`
* ta: `_t wp add`
* talloc: `todo.sh wp alloc`
* twl: `todo.sh wp ls`
* tws: `todo.sh wp summary`
* twg: `todo.sh wp graph`

#### wp notes

* `allocations.conf` in `.actions.d/wp` to set allocations for projects (by minutes per week)
* `est:45`: sets 45 minutes for estimated time to complete task (required)
* `todo.sh wp ls`: once estimated time and weekly allocations are set, this will suggest tasks for this week
  * can be run on individual task groups via `todo.sh wp ls "+office +project"`
* `todo.sh wp summary`: can be run on individual task groups. gives summary of this week's progress towards goals.
* `todo.sh wp graph`: displays graph of this week's progress/goals
