Bashy Config for Mac, Linux, Windows
====================================

Pilfer to your heart's content, at your own risk. 

Note that this stuff has been highly customized for me personally, including
hardcoding some of my usernames. In other words, unless you are me, do not
run `setup.sh` and if you do, well, you are objectively a moron who does
not read READMEs and deserves what you get.

Bash, Node, Go, and (sometimes) Perl
------------------------------------

These are the [only languages] anyone really needs.

[only languages]: https://medium.com/@robmuh/languages-you-need-fa65eeefe6d2

No Python
---------

There I said it.

Python reminds me of my ex-wife. We had good times, but mostly I'm still
angry about all the time and money I invested on her. Read my rants on
[robs.io](https://robs.io).

I have banished Python from my personal workflows and dependencies. Hence,
this new dotfiles repo.

Long Live Perl!
---------------

There is a reason `perlre.so` is included in every other freaking language on
the planet. Perl *defined* the standard for regular expressions and still
does. What's a regular expression? Um, might be time for you to run along and
play with your toys now.

I don't care if some uninformed morons will write things like "have a
healthy disdain for Perl" in their job descriptions. This just shows how
absolutely stupid they are. If they had half a f***ing brain they would
realize the `perl` executable is on every Linux/UNIX computer built for the
last 20 years! Among other things, this is why `perl` is the number one pick
by professional hackers today (even though they don't blast it from the
housetops, and no it isn't Python or Ruby, like on Mr. Robot, even though
Metasploit decided to use Ruby instead of Perl, having started with Perl,
but being caught up in the Ruby craze that never materialized into the
ubiquity Perl still enjoys).

Perl is the most powerful language interpreter found on *any*
Linux/UNIX system ***by default***. Python will ***NEVER*** be able to claim
that. Ruby will ***NEVER*** be able to claim that. In fact, Python AND Ruby
*depend* on the `perlre` lib to even exist. Because deep down they know
who is king.

Morons who say `perl` is for old foggies and those who write ugly code
usually have no idea what `sed` and `awk` even are and why Larry created
`perl` primarily to replace them. Meanwhile, they champion a brain-dead
language that did not see how short-sighted making white-space significant
really was (tanking any expansion of the language to include multi-line
`lambdas` for example.)

Go ahead, have a look at my dotfile and functions and tell me you could
replace the `perl` with `python` or `sed` or `awk` as elegantly. You just
can't.

So run along you little perl-bashing script kiddy. I have no more time to
waste on you. Enjoy your small mind and life.

(Yeah, I considered long and hard to leave that in or not, "Is this
appropriate?" to which I respond, "HELL YES!!")

A Note on File Extensions
-------------------------

Although I am normally rather bothered by file extensions for commands (as
all UNIX purists are) I gave in and used `.sh` extensions to keep VSCode
happy on all platforms and figured it conveyed more meaning given the
shortening of names and what not.