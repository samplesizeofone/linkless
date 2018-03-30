---
title: "War Stories 1: Illegal Operations"
date: 2018-03-15T20:23:37-07:00
draft: false
---

One of my proudest moments in college was forged from a case of Mnt Dew, a copy
of Asheron's Call, SoftICE, a friend's Cyrix 686, and a technical note poorly
Google-translated from French.

Over the course of a single night, we were able to determine that Asheron's
Call crashed on the Cyrix 686 because it didn't implement the RDTSC (Read
Timestamp Counter) instruction supported by Intel chips. But thanks to someone
fluent in French (and Google's primitive ability to do French to English word
substitution), we found out that the RDTSC instrution was not necessarily
critical to a program's execution and could be patched with two no-ops (a no-op
being a single byte instruction, and RDTSC spanning two).

Unfortunately, we were not sophisticated enough to update the excecutable file
on disk. We tried a basic find and replace of RDTSC to no-ops, but
that was pretty close to trying to cure alcohol poisoning with tequila.

Luckily, I had access to SoftICE. SoftICE sits right under the OS and catches
low level events, popping up a nifty text-based UI on demand. Besides the
more commonly used interactive mode, it could also run scripts for different
triggers.

In our case, the trigger was the illegal instruction exception. When the
processor trapped an illegal instruction, we simply checked the value of
memory at the instruction pointer and, if it was RDTSC, write two no-ops in
its place. After that, we could resume program execution. Performance was a
nonissue, since each RDTSC instruction had to be patched no more than once.

(Fun fact, on Intel processors there are two levels of exception handlers. If
an exception is raised, the first line exception handler is invoked. If an
exception is raised *in the exception handler*, a second handler is called.
If an exception happens once more before the inner most handler can return
a triple fault is said to have occured and the CPU does a soft reboot.)

In the end, Asheron's call ran on one of what I can only imagine is a limited
number of Cyrix 686 processors, and I remember distinctly thinking, as I
walked out of the dorms into the morning light, how I could feel my eyeballs
shot through with light-sensitve pain.
