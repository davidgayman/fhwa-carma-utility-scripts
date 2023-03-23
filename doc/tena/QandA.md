# TENA Q & A

**Q: What is the object hierarchy? (vehicle object, sensor object, etc.)**

**A:** d

**Q: What are the project types, how are they structured, linked, and deployed?**

**A:** Each of the following system components is built in an isolated C++ project:

- SDO
- Message
- Publisher
- Subscriber

With no need to compile, deploy the source project to /etc/TENA/<project-name>. (can this be done in-place?)

Local source-level dependency management is performed via CMake package dependency function calls (find_package()).

The directory searched for these is set by TENA_HOME which is injected into the PATH by a .bashrc call to:

```source /opt/TENA/6.0.9/scripts/tenaenv-u2004-gcc9-64-d-v6.0.9.sh &>/dev/null```

**Q: How are the TENA system packages organized, and how are they listed on TRMC?**

**A:** TENA provides a MiddlewareSDK, a x, y, z....

**Q: Where is the SDK documentation?**

**A:** Not hosted anywere, but it can be built locally in by calling `make all` in /opt/TENA/6.0.9/doc/doxygen.

**Q: Where is component documentation for other TRMC-based packages?**

**A:** d


**Q: What documentation can I use to get started developing TENA code?**

**A:** Read the following:

1. TENA-CPP-Training-Presentation.pdf
2. TENA-Middleware-v6.0.9-ProgrammersGuide-2022-09-12.pdf

**Q: d**

**A:** d

**Q: d**

**A:** d

**Q: d**

**A:** d

**Q: d**

**A:** d

**Q: d**

**A:** d

**Q: d**

**A:** d
