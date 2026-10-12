# Smart Healthcare: Arrays vs. Singly Linked Lists (C++)

**Type:** Academic group coursework · **Module:** CT077-3-2-DSTR · **Submitted:** 9 October 2026

This case study presents two C++ console programs that compare array-based storage and a manually implemented singly linked list for analysing 600 sample healthcare records across three facilities.

## My documented contribution

According to the submitted group workload matrix, **Zuhayb Nasir Abdi contributed 50% of the linked-list program work and 25% of documentation/testing**. Other group members contributed to the remaining linked-list and documentation work and to the array program. The project remains a team submission.

## Highlights

- CSV-based analysis of hospital, university medical centre and clinic records
- Sorting by age, visit duration and computed medical cost using selection sort
- Linear, binary and linked-list binary-style search comparisons
- Comparison counts, swap counts, execution time and approximate memory use
- Cost, demographic, care type, quality-check and cross-facility reporting
- 19,900 selection-sort comparisons for each 200-record dataset
- 200 vs 6 comparisons in the documented linear-vs-sorted exact-age search experiment

## Evidence

- [Public project case study](index.html)
- [Documentation highlights and benchmark context](documentation.html)
- Original coursework report: 30 pages, not publicly reproduced because it contains fellow students' identifiers
- C++ source: uploaded to a private GitHub team repository; contact the group for permission to view

## Important limitations

This is not a production healthcare platform. It uses console interaction and coursework datasets, does not provide database persistence or strong healthcare security, and selection sort has O(n²) complexity. Search timing results are report measurements, not independently reproduced benchmarks.
