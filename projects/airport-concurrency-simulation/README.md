# Airport Concurrency Simulation — Java

A console-based Java concurrent programming simulation of six aircraft competing for one runway, three gates and one shared refuelling worker.

## Source-verified features

- Six `Plane` threads with staggered arrival timing and a fixed demonstration random seed
- An `ATC` thread with normal and emergency landing queues and a take-off queue
- Synchronized runway reservations, gate assignment, and a maximum of three planes on the ground
- An urgent queue and normal queue for one `RefuelTruck` worker
- Passenger boarding/disembarkation and ground-crew cleaning/restocking threads
- Signalling by request objects using `synchronized`, `wait()` and `notifyAll()`
- Waiting-time statistics, planes-served count and total boarded passengers at shutdown

## Evidence

The private [source repository](https://github.com/zuhaybnasir-design/airportsimulation) contains an Eclipse project and sample output. In the supplied example, six planes are served, 276 passengers board, and all gates end empty. Those are illustrative run results rather than verified repeatable benchmarks.

The included `README_FIRST.txt` and `Presentation_Script.txt` identify the coursework as **CT074-3-2 Concurrent Programming**. No full report or individual contribution allocation was available in the repository, so this public summary does not claim individual authorship of specific classes.

## Run it

Import the inner `AirportSimulation/` directory using **Eclipse → File → Import → Existing Projects into Workspace**, then run `Main.java` as a Java Application.

Alternatively, compile the files in `AirportSimulation/src` with a JDK and run the `Main` class.

## Constraints and limitations

Educational simulation only; no real aviation control guarantees. Thread scheduling is nondeterministic, timing statistics depend on machine conditions, and the program has not been independently compiled or stress-tested as part of this portfolio update. The repository is currently private, so source access requires permission.
